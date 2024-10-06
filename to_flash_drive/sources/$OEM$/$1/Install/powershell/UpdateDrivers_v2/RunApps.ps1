# Make PowerShell Disappear
$windowcode = '[DllImport("user32.dll")] public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);'
$asyncwindow = Add-Type -MemberDefinition $windowcode -name Win32ShowWindowAsync -namespace Win32Functions -PassThru
$null = $asyncwindow::ShowWindowAsync((Get-Process -PID $pid).MainWindowHandle, 0)

Start-Process "devmgmt.msc" -Wait
Start-Process -FilePath "$Env:HOMEDRIVE\BIT\bit.exe" -ArgumentList '-lv -m -r'
Disable-ScheduledTask -TaskName "RunApps"