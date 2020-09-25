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

## Web management console inschakelen
```powershell
Install-WindowsFeature Web-Mgmt-Service
```
dit installeert de web management service

By default, the Web Management Server will not accept remote connections. To allow this, we’ll have to resort to using Regedit. Open the register by typing regedit.exe at the command prompt. Then, in the left pane, navigate to `HKEY_LOCAL_MACHINE\Software\Microsoft\WebManagement\Server.` Here, change the value for `EnableRemoteManagement` from `0x00000000` to `0x00000001`. Close Regedit with Alt+F4 or by clicking the X symbol in the right top of the program.

## Web management service starten & op auto zetten
```
sc config WMSVC start= auto
net start WMSVC
```



- [ ] SSL configuratie (veiliger)
- [ ] Client side targetting met GPO
