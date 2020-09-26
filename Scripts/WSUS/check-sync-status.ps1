#Load required assemblies
[void][reflection.assembly]::LoadWithPartialName("Microsoft.UpdateServices.Administration")
    
$wsus = [Microsoft.UpdateServices.Administration.AdminProxy]::getUpdateServer()
    
$wsus
#$wsus=Get-WsusServer
$sub=$wsus.GetSubscription()

#get synchronization data
$sub.GetSynchronizationHistory()