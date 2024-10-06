@echo off
setlocal enabledelayedexpansion

:: Admin
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo The script is not running as administrator! Re-run it!
    powershell -command "Start-Process '%~f0' -Verb runAs"
    exit /b
)

schtasks /run /tn "ResetWIN"