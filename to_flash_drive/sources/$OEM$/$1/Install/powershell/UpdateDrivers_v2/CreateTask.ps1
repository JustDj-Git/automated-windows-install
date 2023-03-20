wevtutil set-log Microsoft-Windows-TaskScheduler/Operational /enabled:true

function CreateTask {
 param (
		[PARAMETER(Mandatory = $true)]
		[ValidateNotNullOrEmpty()]
		[String]$taskName,
		[PARAMETER(Mandatory = $true)]
		[ValidateNotNullOrEmpty()]
		[String]$description,
		[PARAMETER(Mandatory = $true)]
		[ValidateNotNullOrEmpty()]
		[String]$filename,
		[PARAMETER(Mandatory = $true)]
		[ValidateNotNullOrEmpty()]
		[String]$WindowStyle,
		[Switch]$Hidden

	)


$TaskSet = New-ScheduledTaskSettingsSet
$TaskSet.DisallowStartIfOnBatteries = $false
$TaskSet.StopIfGoingOnBatteries     = $false
$TaskSet.IdleSettings.StopOnIdleEnd = $false
$TaskSet.Compatibility = 'Win8'

if ($Hidden){
	$TaskSet.Hidden = $true
}

$taskAction = New-ScheduledTaskAction `
    -Execute 'powershell.exe' `
    -Argument "-File $Env:HOMEDRIVE\Install\powershell\UpdateDrivers_v2\$filename.ps1 -WindowStyle $WindowStyle"

$taskTrigger = New-ScheduledTaskTrigger -AtLogOn

$task = Register-ScheduledTask `
    -TaskName $taskName `
    -Action $taskAction `
    -Trigger $taskTrigger `
    -Description $description `
    -RunLevel Highest `
    -Settings $TaskSet `
    -Force

Start-ScheduledTask -TaskName $taskName
Start-Sleep -Seconds 3
}

$taskName = 'Check Drivers v2'
$description = 'Check Drivers on logon untill updates exists'
$filename = 'UpdateDrivers'
$WindowStyle = 'Maximized'

CreateTask -taskName $taskName -description $description -filename $filename -WindowStyle $WindowStyle

######
$taskName = 'Task Handle'
$description = 'Check if task handled'
$filename = 'WaitForTask'
$WindowStyle = 'Hidden'
CreateTask -taskName $taskName -description $description -filename $filename -WindowStyle $WindowStyle -Hidden