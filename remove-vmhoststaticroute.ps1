# Quick modification to add script, this removes both static routes that had been added
$vmhosts = get-vmhost                          # Process all ESX hosts across datacenters
$vmstorips = "10.151.64.52","10.151.64.53"     # IP address for VIP and NFS server
ForEach ($vmhost in $vmhosts){
# Process two entries for each host
    ForEach ($hostroute in $vmstorips){
        $route = (Get-VMHostRoute -VMHost $vmhost.name).where{$_.Destination -eq $hostroute}
        if ($route){
            Remove-VMHostRoute -VMHostRoute $route -Confirm:$False
        } 
    } # Finish routes
} # Finish processing hosts