# Extra drive enablen

## CD drive veranderen van letter
```powershell
Get-WmiObject -Class Win32_volume -Filter "DriveLetter = 'd:'" |Set-WmiInstance -Arguments @{DriveLetter='E:'}
```

## Controleren welke schijf offline is
```powershell
Get-Disk | Where-Object IsOffline -Eq $True
```

## Schijf initialiseren
```powershell
Initialize-Disk -Number 1
```

## Partitie aanmaken
```powershell
New-Partition -Disknumber 1 -Driveletter d -UseMaximumSize
```

## Schijf formateren mbv diskpart:
```
List volume
Select volume X
format fs=ntfs quick label=Data
assign letter D
exit
```

