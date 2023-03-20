$ErrorActionPreference = 'SilentlyContinue'

$log_path = 'X:\Logs'
$null = New-Item -Path $log_path -Name listdisk.txt -itemtype file -force -Value 'list volume'

function Get-Partitions 
{
  diskpart.exe /S $log_path\listdisk.txt > "$log_path\logfile.txt"
  $partitions_number = Get-Content $log_path\logfile.txt |
  Where-Object -FilterScript {
    $_ -like '*Partition*'
  } |
  ForEach-Object -Process {
    ($_ -split '\s+')[2]
  }
  if ($partitions_number) 
  {
    return $partitions_number
  }
  else 
  {
    exit
  }
}

$partitions_number = Get-Partitions

while ($partitions_number) 
{
  $partitions_number = Get-Partitions
  $LISTDISK = "select volume $($partitions_number[0])
    clean
  exit"
  $null = New-Item -Path $log_path -Name listdisk2.txt -itemtype file -force -Value "$LISTDISK"
  diskpart.exe /S $log_path\listdisk2.txt > "$log_path\logfile.txt"
  Start-Sleep -Milliseconds 500
}
