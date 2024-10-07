Function ImportWiFi {
    $Wifi_Profiles = Get-Item -Path 'C:\Install\Wifi_Profile\*.xml'
    foreach ($i in $Wifi_Profiles){
        netsh wlan delete profile "$($i.Basename)" i=* > NULL
        netsh wlan add profile filename="$($i.FullName)" user=all > NULL
        netsh wlan set profileparameter name="$($i.Basename)" connectionmode=auto
        netsh wlan connect name="$($i.Basename)"
    }
}