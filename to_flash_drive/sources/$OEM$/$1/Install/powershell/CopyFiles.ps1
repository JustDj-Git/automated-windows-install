New-Item -Path "$Env:HOMEDRIVE\Install\" -Name "_Logs" -ItemType Directory
Start-Transcript -Path "$Env:HOMEDRIVE\Install\_Logs\CopyFiles_Transcript.log"
$logpath = "$Env:HOMEDRIVE\Install\_Logs\InstallModules.log"

##GetDate
function Get-FormattedDate {
    $date = (Get-Date -Format "MM/dd/yyyy HH:mm:ss").ToString()
    return $date
}
"$(Get-FormattedDate) Copy Files and PS modules" >> $logpath
#
robocopy "$env:HOMEDRIVE\Install\powershell\Modules\" "$Env:ProgramFiles\WindowsPowerShell\Modules" /E >> $Env:HOMEDRIVE\Install\_Logs\robocopy.log
robocopy "T:\_Copy_\to_C" "$Env:HOMEDRIVE\" /E /XF ".gitkeep" >> $Env:HOMEDRIVE\Install\_Logs\robocopy.log
robocopy "T:\_Copy_\to_Desktop" "$Env:HOMEPATH\Desktop" /E /XF ".gitkeep" >> $Env:HOMEDRIVE\Install\_Logs\robocopy.log
robocopy "T:\_Copy_\to_Documents" "$Env:HOMEPATH\Documents" /E /XF ".gitkeep" >> $Env:HOMEDRIVE\Install\_Logs\robocopy.log
"$(Get-FormattedDate) Files copied" >> $logpath

Stop-Transcript