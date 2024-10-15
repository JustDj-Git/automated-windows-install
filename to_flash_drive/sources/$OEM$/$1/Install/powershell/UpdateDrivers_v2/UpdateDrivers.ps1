Start-Transcript -Path "$Env:HOMEDRIVE\Install\_Logs\UpdateDrivers_Transcript.log"

##Globals
Import-Module ImportWiFi
$logpath = "$Env:HOMEDRIVE\Install\_Logs\UpdateDrivers.log"
$BootCount = Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters'
$taskName = 'Check Drivers v2'
$taskHandleName = 'Task Handle'

function FinalTask {
	## Net tweaks
	#Get-NetConnectionProfile -Name 'Office-net' | Set-NetConnectionProfile -NetworkCategory Private
	netsh advfirewall firewall set rule group="network discovery" new enable=yes
	netsh advfirewall firewall set rule group="File and Printer Sharing" new enable=yes
	##
	Remove-Item -path "$Env:HOMEDRIVE\BIT\Files\*"
	##Disable Bit
	Disable-Bitlocker -MountPoint "C:" | out-null
	##Pause updates
	$pause = (Get-Date).AddDays(14) 
	$pause = $pause.ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ssZ") 
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings' -Name 'PauseUpdatesExpiryTime' -Value $pause
	##
	Enable-ScheduledTask -TaskName 'RunApps'
	##
	Stop-ScheduledTask -TaskName "$taskHandleName"
	Disable-ScheduledTask -TaskName "$taskHandleName"
	Disable-ScheduledTask -TaskName "$taskName"
	Shout "Restarting..."
	Restart-Computer
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

function TimeSync {
	Shout "Sync time with servers"
	Start-Service w32time | out-null 
	w32tm /resync /force | out-null 
	Shout "Sync done"  -color 'Green'
}

function CheckInet {
	$timer = [Diagnostics.Stopwatch]::StartNew()

	do {
		$inet = Test-Connection -ComputerName www.google.com -Quiet
		if ($inet -eq $false) {
			ImportWiFi
			Shout "No internet! Waiting for it and recheck" -color 'Red'
			if ($timer.elapsed.TotalMinutes -le 2) {
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
}

####################
## Windows Update Service setup
####################
Shout "Script starting"

CheckInet
TimeSync

$ErrorActionPreference = "SilentlyContinue"
if ($Error) {$Error.Clear()}

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

## Search for driver updates
$Criteria = "IsInstalled=0 and Type='Driver' and IsHidden=0"
Shout 'Searching Drivers Updates...' -color 'Green'
$SearchResult = $Searcher.Search($Criteria)

If ($SearchResult.Updates.Count -eq 0) {
	Shout 'There are no applicable updates for this computer' -color 'Green'
	$updateSvc.Services | ? { $_.IsDefaultAUService -eq $false -and $_.ServiceID -eq "7971f918-a847-4430-9279-4a52d1efe18d" } | % { $UpdateSvc.RemoveService($_.ServiceID) }
	FinalTask
} else {
	## Display available updates
	$Updates = $SearchResult.Updates
	$logIt = $Updates | select Title, DriverModel, DriverVerDate | ft | Out-String
	$logIt >> $logpath
	Shout "$logIt" -color 'Gray'

	##Download drivers
	$UpdatesToDownload = New-Object -Com Microsoft.Update.UpdateColl
	$updates | Where-Object {$_.Title -notlike "*Firmware*"} | ForEach-Object { $UpdatesToDownload.Add($_) | out-null }
	$UpdateSession = New-Object -Com Microsoft.Update.Session
	$Downloader = $UpdateSession.CreateUpdateDownloader()
	$Downloader.Updates = $UpdatesToDownload
	
	try {
		$Downloader.Download()
	} catch {
		Shout 'Nothing to download' -color Green
		FinalTask
		exit
	}
	
	Shout 'Downloading Drivers...' -color Green
	
	##Install drivers
	$UpdatesToInstall = New-Object -Com Microsoft.Update.UpdateColl
	$updates | % { if($_.IsDownloaded) { $UpdatesToInstall.Add($_) | Out-Null } }

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
	Disable-ScheduledTask -TaskName "$taskName"
	Stop-ScheduledTask -TaskName "$taskHandleName"
	Disable-ScheduledTask -TaskName "$taskHandleName"
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

## Reboot if necessary
if ($reboot_need -eq $true){
	Shout 'Rebooting!' -color Red
	Shout '=========='
	Start-Sleep 5
	Restart-Computer
} else {
	FinalTask
}