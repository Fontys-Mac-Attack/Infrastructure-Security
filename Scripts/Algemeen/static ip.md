# IP Address wijzigen

```powershell
Get-NetIPAddress | Set-NetIPAddress -IPAddress `10.10.10.2` -PrefixLength 24 DefaultGateway 10.10.10.1
```

| Syntax | Uitkomst |
| --- | --- |
| `-IPAddress` | Om IP te wijzigen |
| `-PrefixLength` | Subnet mask |
| `-DefaultGateway` | Verwijst naar de default gateway |

