# Domain controller instellen

## Install AD-DS rol
```powershell
Install-WindowsFeature –Name AD-Domain-Services –IncludeManagementTools
```

## Safe mode admin wachtwoord opslaan als variable
```powershell
$Password = Read-Host -Prompt   'Enter SafeMode Admin Password' -AsSecureString
```

## AD DS Configuratie
```powershell
Install-ADDSForest -DomainName "wanckes.nl" -CreateDnsDelegation:$false -DatabasePath "C:\Windows\NTDS" -DomainMode "7" -DomainNetbiosName "wanckes" -ForestMode "7" -InstallDns:$true -LogPath "C:\Windows\NTDS" -NoRebootOnCompletion:$True -SysvolPath "C:\Windows\SYSVOL" -Force:$true
```

## Post Install Config:

### Reboot & Login

### Confirm installation
```powershell
Get-Service adws,kdc,netlogon,dns
```

### Config details van DC
```powershell
Get-ADDomainController
```

### AD Domain details
```powershell
Get-ADDomain wanckes.nl
```

### AD forest details
```powershell
Get-ADForest wanckes.nl 
```

### Controlle of SYSVOL folder wordt geshared
```powershell
Get-smbshare SYSVOL
```