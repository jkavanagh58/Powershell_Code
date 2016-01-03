if ((get-adserversettings).ViewEntireForest -eq $False){
    Set-ADServerSettings -ViewEntireForest $true
}
$eas = Get-CASMailbox -ResultSize Unlimited | 
    where { $_.HasActiveSyncDevicePartnership -eq $True }
# Find activesync devices that have been inactive for 180 or greater days
$del = $eas | ForEach-Object { Get-ActiveSyncDeviceStatistics -Mailbox $_.Identity | where { $_.LastSyncAttempttime -lt (Get-date).adddays(-180) }}
# Remove the activesync device partnership for the inactive devices
$del | % {Remove-ActiveSyncDevice $_.identity -Confirm:$False -Whatif }