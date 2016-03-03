function Export-Credential
{
<#
    This function creates a cred file for easy use
    Example:
    Export-Credential -Credential "Domain\username"
#>
   param
   (
     [Parameter(Mandatory=$true)]
     $Path="$home\Documents\cred.xml",
     [System.Management.Automation.Credential()]
     [Parameter(Mandatory=$true)]
     $Credential
   )
    
  $CredentialCopy = $Credential | Select-Object *    
  $CredentialCopy.Password = $CredentialCopy.Password | ConvertFrom-SecureString    
  $CredentialCopy | Export-Clixml $Path
}
function Import-Credential
{
<#
    This function creates a cred file for easy use
    Example:
    $admincreds = Import-Credential -Path "c:\temp\file.xml"
#>
   param
   (
     [Parameter(Mandatory=$true)]
     $Path = "$home\Documents\cred.xml"
   )
    
  $CredentialCopy = Import-Clixml $path    
  $CredentialCopy.password = $CredentialCopy.Password | ConvertTo-SecureString    
  New-Object system.Management.Automation.PSCredential($CredentialCopy.username, $CredentialCopy.password)
}
# SIG # Begin signature block
# MIIFcwYJKoZIhvcNAQcCoIIFZDCCBWACAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUc42acDDmS+7yJ0vaITyiJbFJ
# IfagggMMMIIDCDCCAfCgAwIBAgIQGvX5RRI9YpZAngq1DRa/XDANBgkqhkiG9w0B
# AQUFADAcMRowGAYDVQQDDBFUZXN0IENvZGUgU2lnbmluZzAeFw0xNTEyMjAxMTM3
# NTNaFw0xNjEyMTkxMTM3NTNaMBwxGjAYBgNVBAMMEVRlc3QgQ29kZSBTaWduaW5n
# MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAvZgOfQPe1JJyZ/U4ML7o
# wqtROeR80tx3EOHTodiQ0Lr6Z2hcOawHooX2u18VQgEBKx0YFZ31vO38zuVQuGBS
# NTrhf8cpRsPr9WJJfajmp7jYTocQQQr/+gpXRInZhKwfFY7eztGq4Ppx1xdAgcJ9
# pdKS4jprOJVT94M6RAQkXzFx1aWDjlkDc7LGzhtMYyYSb/TgwRxEBGTvhK+AQf6F
# W/Ckfz9wL8GZmKksic6Gh2+dnZboInv3HH9CVTycBbJVzT/pdtBN0s4DxdQb0wy4
# X3XBx92JZJHbfbaGJDLjb6as0L65D2h6s5EYemOExqbeI/f7iUNtRSZEzDfAhnvK
# mwIDAQABo0YwRDATBgNVHSUEDDAKBggrBgEFBQcDAzAOBgNVHQ8BAf8EBAMCB4Aw
# HQYDVR0OBBYEFGv8/zr95uNR2BoqTPkwUtcDy9DmMA0GCSqGSIb3DQEBBQUAA4IB
# AQBq5KxJgfSORpi3Jp3ZP5OJaVJcn7E/xjHD/KMmbUakhg3IC9LzLly57Mhfub4h
# 6uhU87rEUUStl/ED+P+r+q4pv5XM/RpTbQpf2Mhe2Uve6MVs07iGnwyeW7PVlHSo
# CUVdiSO/4sm/wb7Zjz+vBWrxC7s3Dmfh//HWF1GO6QnsauPJeOYPc9VScJk8jNDW
# mNK1qQrRTHtMgEfou4YjcV2ATxlW6sVOEp3NkhkJSmgpIztnhF7Kfd4yXRKCjT4H
# QHm/gJ526fCjQucPlKbaPQDyL5xcidgIjaHlDkEuxTQd8jEQAotqQZngvPZNLPRj
# vzKU6MkInK9QTXm/KefH88S7MYIB0TCCAc0CAQEwMDAcMRowGAYDVQQDDBFUZXN0
# IENvZGUgU2lnbmluZwIQGvX5RRI9YpZAngq1DRa/XDAJBgUrDgMCGgUAoHgwGAYK
# KwYBBAGCNwIBDDEKMAigAoAAoQKAADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIB
# BDAcBgorBgEEAYI3AgELMQ4wDAYKKwYBBAGCNwIBFTAjBgkqhkiG9w0BCQQxFgQU
# onCZ7ubJ1oMe3x+EmDDuZQuik9UwDQYJKoZIhvcNAQEBBQAEggEAaHOCM7F+VGT3
# SvdsYV687GBf5GIePP4WO5YB/Majq1IXldenN9AR6iN/wAmBXwVuJrIMtv0KUl75
# wMaeaT3SJD7I7GObGWmO6guM+s0NL9GSLgKNUBqmsq16At+vhkxtDnul2NNxOBfC
# 25OQf7RPSej87Y4TWqxftKfvfT2RV7cKjzE54xhB9j94iuU1FUG0ZRAZi7hMfcxX
# Z3o1ioWLx18riWknBUzBq+MwbbHroK9bInPYwBAw7UbAXHNErTSiX8JQX0saNZgA
# bASEx9r0co4TXhSJ18eZV0/ASbhB1WtS+EGmTvpqHOrcKjbAzAbG+C/kbzbezFRj
# 9W4o+Rip3Q==
# SIG # End signature block