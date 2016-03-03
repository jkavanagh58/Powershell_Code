# Load PowerCLI which includes several Snapins
# If PowerCLI has been installed and you are not launching via
# the PowerCLI desktop shortcut created during install
# Older process, needs to be updated for PowerCli 6 Update 2
if (!(get-pssnapin vm* -ErrorAction SilentlyContinue)){add-pssnapin vm*}

# Connect to vSphere
# using alternate credentials
connect-viserver mn1ops07.corp.swagelok.lan -cred $admincreds
# Multiple vcenter connections with like credentials
connect-viserver "mn1ops07.corp.swagelok.lan","mn1ops07b.corp.swagelok.lan" -Cred $admincreds

# List VMs
Get-VM

# List PoweredOn VMs
get-vm | where-object {$_.PowerState -eq 'PoweredOn'}
get-view -ViewType VirtualMachine -Filter @{"runtime.Powerstate" = "PoweredOn"}

# List VMs on a specific host
get-vm -Location (get-vmhost mn1esx21.corp.swagelok.lan)

# Quick VMware Tools Audit - very quick
# Tweaked for PowerCLI 6
get-vm | % { get-view $_.id } | select Name, @{ Name="ToolsVersion"; Expression={$_.config.tools.toolsVersion}},@{ Name="ToolStatus"; Expression={$_.Guest.ToolsVersionStatus}} | Where {$_.ToolStatus -ne "guestToolsCurrent"} | Sort-Object "ToolsVersion"
get-view -ViewType VirtualMachine | select Name, @{n="Tools Status";e={$_.Guest.ToolsStatus}},@{n="Version Status";e={$_.Guest.ToolsVersionStatus}}
(get-view -ViewType VirtualMachine).Guest | select Hostname, ToolsStatus, ToolsVersionStatus
get-view -ViewType VirtualMachine | select Name, @{n="Tools Status";e={$_.Guest.ToolsStatus}},@{n="Version Status";e={$_.Guest.ToolsVersionStatus}},
@{n="Hardware Version";e={$_.Guest.config.version}}

# Change settings for Network Adapter
# Example 1 - change adapter type to Vmxnet3
get-networkadapter -vm mn1ops02 | set-networkadapter -type Vmxnet3 -confirm:$false -RunAsync
# Example 2 - Find VMs with disconnected networkadapters
get-networkadapter -vm (get-vm | ? {$_.Powerstate -eq 'poweredOn'}) |
Select @{n="VM";e={$_.Parent}},@{n="Adapter Name";e={$_.Name}},@{n="Connected";e={$_.Connectionstate.Connected}} | where {$_.Connected -eq $false}

# List Datastores
Get-Datastore

