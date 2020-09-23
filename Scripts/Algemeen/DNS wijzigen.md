# DNS servers wijzigen
```powershell
Set-DnsClientServerAddress -InterfaceIndex 4 -ServerAddresses ("10.10.10.2","8.8.8.8")
```
