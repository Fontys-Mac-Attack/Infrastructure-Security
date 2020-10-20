# Admin Wachtwoord wijzigen

```powershell
$Password = Read-Host -Prompt "Enter admin password" -AsSecureString
Set-LocalUser -Name "Administrator" -Password $Password
```