#Requires -Version 5
# A Simple function to be added to the Powershell profile for loading PowerCLI 6
Function load-powecli {
    # Used for PowerCLI 6 now that it is in the form of modules
    (get-module -Name VMware.* -ListAvailable).ForEach{Import-Module $_}
}