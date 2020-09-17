# Computer aan domain joinen

```powershell
Add-Computer -Domainname voorbeeld.nl -Domaincredential voorbeeld\administrator -restart -force
```

| Syntax | Uitkomst |
| --- | --- |
| `Add-Computer` | Daadwerkelijke commando om computer het domein te laten joinen |
| `-Domainname` | Flag voor de domein naam |
| `-Domaincredential` | flag voor de domain credentials |
| `-force` | Er wordt niet om bevestiging gevraagd |