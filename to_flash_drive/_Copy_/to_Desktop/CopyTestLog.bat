@echo off

net use x: "\\desktop-6jf5hog\BIT Files"

set file="%SystemDrive%\BIT\Files\*.log"
FOR /F "delims=" %%i IN ("%file%") DO (
set filename=%%~ni
)

robocopy "%SystemDrive%\BIT\Files" "X:\%filename%" "*.log" >> %SystemDrive%\Install\_Logs\robocopy.log
robocopy "%SystemDrive%\Install\_Logs" "X:\%filename%" "*.txt" >> %SystemDrive%\Install\_Logs\robocopy.log