@echo off
setlocal enabledelayedexpansion

for /r "%~dp0Drivers_PE\" %%f in (*.inf) do (
    PNPUtil.exe /add-driver "%%~ff" /install
)

endlocal