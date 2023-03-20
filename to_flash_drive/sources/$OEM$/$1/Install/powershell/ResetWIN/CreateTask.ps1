$taskAction = New-ScheduledTaskAction `
    -Execute 'powershell.exe' `
    -Argument "-File C:\Install\powershell\ResetWIN\ResetWIN.ps1"

$taskName = "ResetWIN"
$description = "ResetWIN"

$task = Register-ScheduledTask `
    -TaskName $taskName `
    -Action $taskAction `
    -Description $description `
    -RunLevel Highest `
    -User SYSTEM `
    -Force