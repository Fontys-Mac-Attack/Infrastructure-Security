# DHCP Installatie & configuratie

## DHCP server feature installeren
```powershell
Install-WindowsFeature -Name DHCP
```

## DHCP Scope aan server toevoegen
```powershell
Add-DhcpServerv4Scope -Name 'vlan-servers-ins1' -StartRange 10.10.10.1 -EndRange 10.10.10.254 -SubnetMask 255.255.255.0
```

## DHCP Exclusion range toevoegen
```powershell
Add-Dhcpserverv4ExclusionRange -ScopeId 'vlan-servers-ins1' -StartRange 10.10.10.100 -EndRange 10.10.10.199
```

## Options op scope level wijzigen
```powershell
Set-DhcpServerv4OptionValue -ScopeID 'vlan-servers-ins1' -DNSServer 10.10.10.2 -DNSDomain wanckes.nl -Router 10.10.10.1
```

## Options op server level wijzigen
```powershell
Set-DhcpServerv4OptionValue -DNSServer 10.10.10.2 -DNSDomain wanckes.nl
```

## DHCP Server authoriseren
```powershell
Add-DhcpServerInDC -DnsName dc-wanckes-01.wanckes.nl
```

## Informatie over scope weergeven
```powershell
Get-DhcpServerv4Scope | Select-Object -Property *
```