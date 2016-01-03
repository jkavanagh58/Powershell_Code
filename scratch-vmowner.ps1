$vms = "is1ops04","is1ops05","sc1ops01","sc1ops02"
foreach ($vm in $vms){
    $varOwner = get-vm $vm | get-annotation -customattribute "Owner"
    "Virtual Machine {0} currently shows an owner of {1}" -f $vm, $varOwner.value
}