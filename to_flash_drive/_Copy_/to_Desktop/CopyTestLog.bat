@echo off
setlocal enabledelayedexpansion

set "sharedFolder=BIT Files"

echo Getting the current IP address... >> %SystemDrive%\Install\_Logs\CopyTestLog.log
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr "IPv4"') do (
    set ip=%%a
    set ip=!ip:~1!
    echo Current IP address: !ip! >> %SystemDrive%\Install\_Logs\CopyTestLog.log
    goto :found_ip
)

:found_ip
for /f "tokens=1-3 delims=." %%a in ("%ip%") do (
    set subnet=%%a.%%b.%%c.
    echo Subnet detected: !subnet!0/24 >> %SystemDrive%\Install\_Logs\CopyTestLog.log
)

set foundPC=

echo Scanning network using fping.exe on subnet !subnet!0/24, excluding IP ending with .1... >> %SystemDrive%\Install\_Logs\CopyTestLog.log
for /f %%i in ('%SystemDrive%\Install\bats\fping\fping.exe -agq !subnet!0/24 2^>nul') do (
    for /f "tokens=4 delims=." %%x in ("%%i") do (
        if %%x neq 1 (
            echo Host %%i is reachable. Checking for shared folder %sharedFolder%... >> %SystemDrive%\Install\_Logs\CopyTestLog.log
			dir "\\%%i\%sharedFolder%" >nul 2>&1
            if !errorlevel! equ 0 (
                echo Shared folder found on %%i >> %SystemDrive%\Install\_Logs\CopyTestLog.log
                set foundPC=%%i
                goto :mount_share
            ) else (
                echo Shared folder not found on %%i >> %SystemDrive%\Install\_Logs\CopyTestLog.log
            )
        ) else (
            echo Skipping IP: %%i
        )
    )
)

echo No PC with the shared folder was found. >> %SystemDrive%\Install\_Logs\CopyTestLog.log
goto :eof

:mount_share
echo Mounting shared folder from \\!foundPC!\%sharedFolder% to drive X:... >> %SystemDrive%\Install\_Logs\CopyTestLog.log
net use x: \\!foundPC!\%sharedFolder% /persistent:no
if !errorlevel! equ 0 (
    echo Folder successfully mounted to x: >> %SystemDrive%\Install\_Logs\CopyTestLog.log
	goto :copy_logs
) else (
    echo Failed to mount the shared folder. >> %SystemDrive%\Install\_Logs\CopyTestLog.log
)

:copy_logs
set file="%SystemDrive%\BIT\Files\*.log"
FOR /F "delims=" %%i IN ("%file%") DO (
	set filename=%%~ni
)

robocopy "%SystemDrive%\BIT\Files" "X:\%filename%" "*.log" >> %SystemDrive%\Install\_Logs\robocopy.log
robocopy "%SystemDrive%\Install\_Logs" "X:\%filename%" "*.txt" >> %SystemDrive%\Install\_Logs\robocopy.log

:eof
