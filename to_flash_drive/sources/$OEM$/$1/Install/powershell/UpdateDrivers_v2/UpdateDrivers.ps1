﻿Start-Transcript -Path "$Env:HOMEDRIVE\Install\_Logs\UpdateDrivers_Transcript.log"

##Globals
Import-Module ImportWiFi
$logpath = "$Env:HOMEDRIVE\Install\_Logs\UpdateDrivers.log"
$BootCount = Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters'
$taskName = 'Check Drivers v2'
function DoWork {
	## Net tweaks
	#Get-NetConnectionProfile -Name 'Office-net' | Set-NetConnectionProfile -NetworkCategory Private
	netsh advfirewall firewall set rule group="network discovery" new enable=yes
	netsh advfirewall firewall set rule group="File and Printer Sharing" new enable=yes
	##
	Remove-Item -path "$Env:HOMEDRIVE\BIT\files\*"
	##Disable Bit
	Disable-Bitlocker -MountPoint "C:" | out-null
	##Pause updates
	$pause = (Get-Date).AddDays(14) 
	$pause = $pause.ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ssZ") 
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings' -Name 'PauseUpdatesExpiryTime' -Value $pause
	##
	Unregister-ScheduledTask -TaskName $taskName -Confirm:$false
	##
	$b = '


██████   ██████  ███    ██ ███████ 
██   ██ ██    ██ ████   ██ ██      
██   ██ ██    ██ ██ ██  ██ █████   
██   ██ ██    ██ ██  ██ ██ ██      
██████   ██████  ██   ████ ███████ 


'
	Shout $b -color 'Green'
	Start-Process "devmgmt.msc" -Wait
	Start-Process -FilePath "$Env:HOMEDRIVE\BIT\bit.exe" -ArgumentList '-lv -m -r'
}

function Shout {
	param(
		[parameter(Mandatory = $true)]
		$text,
		$color
	)

    $date = (Get-Date -Format "MM/dd/yyyy HH:mm:ss").ToString()
    $finaltext = $date + ' ' + $text
    $finaltext >> $logpath
    if ($color){
        Write-Host $finaltext -ForegroundColor $color
    } else {
        Write-Host $finaltext
    }
}

Shout "Script starting"

##Check inet
$timer = [Diagnostics.Stopwatch]::StartNew()

do {
    $inet = Test-Connection -ComputerName www.google.com -Quiet
    if ($inet -eq $false) {
		ImportWiFi
		if ($timer.elapsed.TotalMinutes -le 2) {
			Shout "No internet! Waiting for it 10 sec and recheck" -color 'Red'
			Start-Sleep 10
		} else {
			Shout "2 minutes are over. reboot"
			Restart-Computer
		}
    } else {
		Shout "Internet detected" -color 'Green'
    }
} while ($inet -eq $false)

$timer.Stop()
$timer.Reset()
####################

$ErrorActionPreference = "SilentlyContinue"
if ($Error) {
	$Error.Clear()
}

try {
      $UpdateSvc = New-Object -ComObject Microsoft.Update.ServiceManager
      $UpdateSvc.AddService2("7971f918-a847-4430-9279-4a52d1efe18d",7,"")
      $Session = New-Object -ComObject Microsoft.Update.Session
      $Searcher = $Session.CreateUpdateSearcher()
    } catch {
		  return
    }

$Searcher.ServiceID = '7971f918-a847-4430-9279-4a52d1efe18d'
$Searcher.SearchScope =  1 # MachineOnly
$Searcher.ServerSelection = 3 # Third Party
          
$Criteria = "IsInstalled=0 and Type='Driver' and IsHidden=0"
Shout 'Searching Drivers Updates...' -color 'Green'
$SearchResult = $Searcher.Search($Criteria)

If ($SearchResult.Updates.Count -eq 0) {
  Shout 'There are no applicable updates for this computer' -color 'Green'
  $updateSvc.Services | ? { $_.IsDefaultAUService -eq $false -and $_.ServiceID -eq "7971f918-a847-4430-9279-4a52d1efe18d" } | % { $UpdateSvc.RemoveService($_.ServiceID) }
	DoWork
} else {
	$Updates = $SearchResult.Updates
	
	#Show available
	$logIt = $Updates | select Title, DriverModel, DriverVerDate | ft | Out-String
	$logIt >> $logpath
	
  Shout "$logIt" -color 'Gray'

	##Download drivers
	$UpdatesToDownload = New-Object -Com Microsoft.Update.UpdateColl
	$updates | where {($_.Title -Notlike "*Firmware*") -or ($_.Title -Notlike "*Intel - net*") -or ($_.Title -Notlike "*System*")} | % { $UpdatesToDownload.Add($_) | out-null }
	$UpdateSession = New-Object -Com Microsoft.Update.Session
	$Downloader = $UpdateSession.CreateUpdateDownloader()
	$Downloader.Updates = $UpdatesToDownload
	
	try {
		$Downloader.Download()
	} catch {
		Shout 'Nothing to download' -color Green
		DoWork
		exit
	}
	
	Shout 'Downloading Drivers...' -color Green
	
	##Install drivers
	$UpdatesToInstall = New-Object -Com Microsoft.Update.UpdateColl
	$updates | % { if($_.IsDownloaded) { $UpdatesToInstall.Add($_) | out-null } }
	Shout 'Installing Drivers...' -color Green
	$Installer = $UpdateSession.CreateUpdateInstaller()
	$Installer.Updates = $UpdatesToInstall
	$InstallationResult = $Installer.Install()
	
	if($InstallationResult.RebootRequired) { 
		Shout 'Reboot required!' -color Red
		$reboot_need = $true
	} else { 
		Shout 'Done..' -color Green
		$reboot_need = $false
	}
	##
	$updateSvc.Services | ? { $_.IsDefaultAUService -eq $false -and $_.ServiceID -eq "7971f918-a847-4430-9279-4a52d1efe18d" } | % { $UpdateSvc.RemoveService($_.ServiceID) }
}

if ($BootCount.BootId -gt '5'){
    Unregister-ScheduledTask -TaskName $taskName -Confirm:$false
    Shout "Task Removed bec it's $($BootCount.BootId) reboot" -color Red
		$b = "
==============================================

███████ ██████  ██████   ██████  ██████  
██      ██   ██ ██   ██ ██    ██ ██   ██ 
█████   ██████  ██████  ██    ██ ██████  
██      ██   ██ ██   ██ ██    ██ ██   ██ 
███████ ██   ██ ██   ██  ██████  ██   ██ 

==============================================
"
	Shout $b -color red
	pause
}


if ($reboot_need -eq $true){
  Shout 'Rebooting!' -color Red
  Shout '=========='
  Start-Sleep 5
	Restart-Computer
} else {
	DoWork
}