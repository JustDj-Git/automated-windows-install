Start-Transcript -Path "$Env:HOMEDRIVE\Install\_Logs\InstallApps_Transcript.log"
$logpath = "$Env:HOMEDRIVE\Install\_Logs\InstallApps.log"

##GetDate
function Get-FormattedDate {
  $date = (Get-Date -Format 'MM/dd/yyyy HH:mm:ss').ToString()
  return $date
}

"$(Get-FormattedDate) Install apps" >> $logpath
Start-Process -Wait -FilePath "$Env:HOMEDRIVE\Install\Apps\vc_redist.x64.exe" -ArgumentList '/install /quiet /norestart' -PassThru >> $logpath
Start-Process -Wait -FilePath "$Env:HOMEDRIVE\Install\Apps\TeamViewer_Setup.exe" -ArgumentList '/S' -PassThru >> $logpath
"$(Get-FormattedDate) Apps installed" >> $logpath
Stop-Transcript