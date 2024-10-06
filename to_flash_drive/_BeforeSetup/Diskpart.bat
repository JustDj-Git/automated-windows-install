@echo off
setlocal enabledelayedexpansion

set "drive=%~d0"
rem set path="%path%;%drive%\_BeforeSetup"
copy "%drive%\_BeforeSetup\findstr.exe" "X:\windows\system32\" /Y

:: Запуск diskpart и получение списка дисков
(echo list disk) > diskpart_script.txt
diskpart /s diskpart_script.txt > disk_list.txt

:: Поиск USB флешки
 set usb_disk=
 for /f "tokens=1,2,3" %%a in (disk_list.txt) do (
     if "%%a"=="Disk" (
         (echo select disk %%b) > diskpart_script.txt
         (echo detail disk) >> diskpart_script.txt
         diskpart /s diskpart_script.txt > disk_detail.txt
         findstr /i "Removable" disk_detail.txt > nul
         if !errorlevel! == 0 (
             set usb_disk=%%b
         )
     )
 )

:: Форматирование всех дисков, кроме USB флешки
 for /f "tokens=1,2" %%a in (disk_list.txt) do (
     if "%%a"=="Disk" (
         if not "%%b"=="!usb_disk!" (
             (echo select disk %%b) > diskpart_script.txt
             (echo clean) >> diskpart_script.txt
             diskpart /s diskpart_script.txt
         )
     )
 )

endlocal