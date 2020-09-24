# WSUS Installatie

## WSUS feature opzoeken
```powershell
Get-WindowsFeature –Name UpdateServices*
```

## WSUS feature installeren (Windows internal database)
```powershell
Install-WindowsFeature -Name UpdateServices-Services,UpdateServices-WidDB -IncludeManagementTools
```

## WSUS feature installeren (SQL server instance)
```powershell
Install-WindowsFeature -Name UpdateServices-Services,UpdateServices-DB -IncludeManagementTools
```

## Update folder aanwijzen
```powershell
cd 'C:\Program Files\Update Services\tools'
```
met WID:
```powershell
.\WsusUtil.exe postinstall CONTENT_DIR=D:\WSUS
```
met MS-SQL server:
```powershell
.\WsusUtil.exe postinstall SQL_INSTANCE_NAME="SQLServer\Instance" CONTENT_DIR=D:\WSUS
```

## Eventuele analyse WSUS installatie via best practice analyzer
```powershell
Invoke-BpaModel -ModelId Microsoft/Windows/UpdateServices
Get-BpaResult -ModelId Microsoft/Windows/UpdateServices | Select Title,Severity,Compliance | Format-List
```

- [ ] SSL configuratie (veiliger)