# Active Directory vullen

## Organisation unit aanmaken in andere OU
```powershell
New-ADOrganizationalUnit -Name "Users" -Path "OU=Accounts,DC=WANCKES,DC=NL
```
Dit maakt de ou "Users" aan in de OU "Accounts"


