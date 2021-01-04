$computer = get-content C:\Users\TEMPUSER\Documents\dns.txt
$NICs = Get-WMIObject Win32_NetworkAdapterConfiguration -computername $computer |where{$_.IPEnabled -Eq $True}
  Foreach($NIC in $NICs) {

$DNSServers = "10.10.10.2","10.10.10.3"
 $NIC.SetDNSServerSearchOrder($DNSServers)
 $NIC.SetDynamicDNSRegistration($True)
}