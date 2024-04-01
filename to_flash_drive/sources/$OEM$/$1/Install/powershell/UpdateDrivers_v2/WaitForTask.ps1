Write-Host 'Do not close this window if you see it!'
$taskName = "Check drivers v2"
$timer = $false

do {
  $inet = Test-Connection -ComputerName www.google.com -Quiet
  $taskInfo = Get-ScheduledTaskInfo -TaskName $taskName -ErrorAction Stop
  $ts = New-TimeSpan -Start $taskInfo.LastRunTime -End (Get-Date)
  if (($($ts.Minutes) -gt '10') -and ($inet -eq $true)) {$timer = $true} else {Start-Sleep -Seconds 500}
} until ($timer -eq $true)

Restart-Computer

# Make PowerShell Disappear
$windowcode = '[DllImport("user32.dll")] public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);'
$asyncwindow = Add-Type -MemberDefinition $windowcode -name Win32ShowWindowAsync -namespace Win32Functions -PassThru
$null = $asyncwindow::ShowWindowAsync((Get-Process -PID $pid).MainWindowHandle, 0)