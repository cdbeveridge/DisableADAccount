import-module ActiveDirectory 

#set timespan 
$Inactive = New-Timespan -Days 60

#search for accounts that have not authenticated for over specified timespan. output file to csv and disable account
Search-ADAccount -SearchBase "ou=*" –UsersOnly –AccountInactive –TimeSpan $inactive| Where-Object {$_.Enabled -eq $true} |
Out-File c:\Scripts\lastLogon.csv
Disable-ADAccount