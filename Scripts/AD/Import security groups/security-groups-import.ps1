# Import active directory module for running AD cmdlets
Import-Module activedirectory
  
#Store the data from security-groups.csv in the $ADGroups variable
$ADGroups = Import-csv "\\wanckes.nl\utility\Scripts\Infrastructure-Security\Scripts\AD\Import security groups\security-groups.csv"

#Loop through each row containing user details in the CSV file 
foreach ($Group in $ADGroups)
{
	#Read user data from each field in each row and assign the data to a variable as below
		
	$Type 	= $Group.type
	$TempName 	= $Group.name

    if ($Type -Eq "DomainLocal") {
        $Path = "OU=Domain Local,OU=Groups,DC=WANCKES,DC=NL"
        $Name = "sg-dl-$Tempname"
    }
    Else {
        $Path = "OU=Global,OU=Groups,DC=WANCKES,DC=NL"
        $Name = "sg-g-$Tempname"
    }


	#User does not exist then proceed to create the new user account
		
    #Account will be created in the OU provided by the $OU variable read from the CSV file
    New-ADGroup -Groupcategory Security -Groupscope "$Type" -Name $Name -path $path
	    
}
