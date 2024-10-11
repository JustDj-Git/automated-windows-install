@echo off

set RCLONE_DIR=%SystemDrive%\Install\bats\rclone
set LOG_DIR=%SystemDrive%\BIT\Files\
set ONEDRIVE_REMOTE=OneDrive:BIT_Files

%RCLONE_DIR%\rclone.exe sync %LOG_DIR% %ONEDRIVE_REMOTE% --progress --config %RCLONE_DIR%\rclone.conf

if %ERRORLEVEL% equ 0 (
    echo Files successfully uploaded to OneDrive. >> %SystemDrive%\Install\_Logs\CopyTestLog.log
) else (
    echo Error occurred during file upload. >> %SystemDrive%\Install\_Logs\CopyTestLog.log
	pause
)
