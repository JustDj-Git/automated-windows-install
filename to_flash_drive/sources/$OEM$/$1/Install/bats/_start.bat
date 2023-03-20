@echo off

 for /R %SystemDrive%\Install\bats\bats_HERE %%x in (*.bat) do (
 echo Run %%x >> %SystemDrive%\Install\_Logs\BatsLogs.log
 call "%%x"
 echo Finished %%x >> %SystemDrive%\Install\_Logs\BatsLogs.log
)
exit