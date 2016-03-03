# Quick script to push the vmstor static route after Puskar made changes
$vmhosts = get-vmhost          # Process all ESX hosts across datacenters
$vmstorip = "10.151.64.32"     # New IP assigned by Puskar
ForEach ($vmhost in $vmhosts){
# Process two entries for each host
    New-VMHostRoute -vmhost $vmhost -Destination $vmstorip -Gateway 10.217.25.1 -PrefixLength 32 -Confirm:$false 
} # Finish processing hosts