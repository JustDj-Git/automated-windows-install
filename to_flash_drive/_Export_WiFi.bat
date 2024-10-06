@echo off
setlocal enabledelayedexpansion

set "scriptDrive=%~d0"

set "export_dir=%scriptDrive%\sources\$OEM$\$1\Install\Wifi_Profile"

if not exist "%export_dir%" (
    mkdir "%export_dir%"
)

for /f "skip=9 tokens=1,2 delims=:" %%a in ('netsh wlan show profiles') do (
    set "profile_name=%%b"
    set "profile_name=!profile_name:~1!"

    if not "!profile_name!"=="" (
        netsh wlan export profile name="!profile_name!" folder="%export_dir%" key=clear >nul
    )
)
