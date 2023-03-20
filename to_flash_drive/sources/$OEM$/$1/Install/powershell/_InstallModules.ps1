Start-Transcript -Path "$Env:HOMEDRIVE\Install\_Logs\InstallModules_Transcript.log"
$logpath = "$Env:HOMEDRIVE\Install\_Logs\InstallModules.log"

##GetDate
function GetFormattedDate {
    $date = (Get-Date -Format "MM/dd/yyyy HH:mm:ss").ToString()
    return $date
}

"$(GetFormattedDate) Install modules" >> $logpath
robocopy "$Env:HOMEDRIVE\Install\powershell\Modules\" "$Env:ProgramFiles\WindowsPowerShell\Modules" /E >> $Env:HOMEDRIVE\Install\_Logs\robocopy.log
"$(GetFormattedDate) Modules installed" >> $logpath
Stop-Transcript