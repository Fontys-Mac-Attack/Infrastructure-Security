# Import active directory module for running AD cmdlets
Import-Module activedirectory
  
#Store the data from ADUsers.csv in the $ADUsers variable
$ADUsers = Import-csv 'C:\Users\TEMPUSER\Documents\Bulk user import\bulk-user-import.csv'

#Loop through each row containing user details in the CSV file 
foreach ($User in $ADUsers)
{
	#Read user data from each field in each row and assign the data to a variable as below
		
	$Username 	= $User.Username
	$Password 	= $User.Password
	$Firstname 	= $User.GivenName
	$MiddleInitial = $User.MiddleInitial
	$Lastname 	= $User.Surname
	$OU 		= "OU=Users,OU=Accounts,DC=wanckes,DC=nl"
    $email      = $User.Email
    $streetaddress = $User.StreetAddress
    $city       = $User.City
    $zipcode    = $User.ZipCode
    $state      = $User.StateFull
    $country    = $User.CountryFull
    $telephone  = $User.TelephoneNumber
    $jobtitle   = $User.JobTitle
    $company    = $User.Company
    $department = $User.Department
    $Password = $User.Password
	$Memberoff = $User.MemberOff


	#Check to see if the user already exists in AD
	if (Get-ADUser -F {SamAccountName -eq $Username})
	{
		 #If user does exist, give a warning
		 Write-Warning "A user account with username $Username already exist in Active Directory."
	}
	else
	{
		#User does not exist then proceed to create the new user account
		
        #Account will be created in the OU provided by the $OU variable read from the CSV file
        New-ADUser -SamAccountName "$Username" -UserPrincipalName "$Username@wanckes.nl" -Name "$Firstname $Lastname" -GivenName "$Firstname" -Surname "$Lastname" -Initials "$MiddleInitial" -EmailAddress "$email" -Enabled $True -DisplayName "$Lastname, $Firstname" -Path $OU -City "$city" -Country "$country" -PostalCode "$zipcode" -Company "$company" -State "$state" -StreetAddress "$streetaddress" -OfficePhone "$telephone" -Title "$jobtitle" -Department "$department" -AccountPassword (convertto-securestring $Password -AsPlainText -Force) -ChangePasswordAtLogon $True -ProfilePath "\\wanckes.nl\Utility\profiles$\%username%" -HomePage "https://www.wanckes.nl"
        Add-ADGroupmember -Members "$Username" -Identity "$Memberoff"  
	}
}
