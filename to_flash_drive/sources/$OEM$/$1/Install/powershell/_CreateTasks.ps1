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
		[Switch]$Hidden,
		[Switch]$NoAutoStart,
		[Switch]$Start,
		[Switch]$System,
		[Switch]$Disabled
	)


	$TaskSet = New-ScheduledTaskSettingsSet
	$TaskSet.DisallowStartIfOnBatteries = $false
	$TaskSet.StopIfGoingOnBatteries     = $false
	$TaskSet.IdleSettings.StopOnIdleEnd = $false
	$TaskSet.WakeToRun = $true
	$TaskSet.Compatibility = 'Win8'

	if ($Hidden){
		$TaskSet.Hidden = $true
	}

	$taskAction = New-ScheduledTaskAction `
		-Execute 'powershell.exe' `
		-Argument "-File $Env:HOMEDRIVE\Install\powershell\UpdateDrivers_v2\$filename.ps1 -WindowStyle $WindowStyle"

	$taskParams = @{
		TaskName    = $taskName
		Action      = $taskAction
		Description = $description
		RunLevel    = 'Highest'
		Settings    = $TaskSet
		Force       = $true
	}

	if ($System) {
		$taskParams.User = 'SYSTEM'
	}

	if ($NoAutoStart) {
		Register-ScheduledTask @taskParams
	} else {
		$taskTrigger = New-ScheduledTaskTrigger -AtLogOn
		Register-ScheduledTask @taskParams -Trigger $taskTrigger
	}

	if ($Start){
		Start-ScheduledTask -TaskName $taskName
	}

	if ($Disabled){
		Disable-ScheduledTask -TaskName $taskName
	}

}

$taskName = 'Check Drivers v2'
$description = 'Check Drivers on logon untill updates exists'
$filename = 'UpdateDrivers'
$WindowStyle = 'Maximized'

CreateTask -taskName $taskName -description $description -filename $filename -WindowStyle $WindowStyle -Start

######
$taskName = 'Task Handle'
$description = 'Check if task handled'
$filename = 'WaitForTask'
$WindowStyle = 'Hidden'

CreateTask -taskName $taskName -description $description -filename $filename -WindowStyle $WindowStyle -Hidden -Start

######
$taskName = 'RunApps'
$description = "Run apps"
$filename = 'RunApps'
$WindowStyle = 'Hidden'

CreateTask -taskName $taskName -description $description -filename $filename -WindowStyle $WindowStyle -Hidden -Disabled

######
$taskName = "ResetWIN"
$description = "ResetWIN"
$filename = 'ResetWIN'
$WindowStyle = 'Hidden'

CreateTask -taskName $taskName -description $description -filename $filename -WindowStyle $WindowStyle -Hidden -NoAutoStart -System