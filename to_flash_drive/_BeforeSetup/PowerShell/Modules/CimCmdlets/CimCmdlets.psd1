@{
GUID="{Fb6cc51d-c096-4b38-b78d-0fed6277096a}"
Author="PowerShell"
CompanyName="Microsoft Corporation"
Copyright="Copyright (c) Microsoft Corporation."
ModuleVersion="7.0.0.0"
CompatiblePSEditions = @("Core")
PowerShellVersion="3.0"
RootModule="Microsoft.Management.Infrastructure.CimCmdlets"
RequiredAssemblies="Microsoft.Management.Infrastructure.CimCmdlets.dll","Microsoft.Management.Infrastructure.Dll"
FunctionsToExport = @()
CmdletsToExport= "Get-CimAssociatedInstance", "Get-CimClass", "Get-CimInstance", "Get-CimSession", "Invoke-CimMethod",
    "New-CimInstance","New-CimSession","New-CimSessionOption","Register-CimIndicationEvent","Remove-CimInstance",
    "Remove-CimSession","Set-CimInstance",
    "Export-BinaryMiLog","Import-BinaryMiLog"
AliasesToExport = "gcim","scim","ncim", "rcim","icim","gcai","rcie","ncms","rcms","gcms","ncso","gcls"
HelpInfoUri="https://aka.ms/powershell73-help"
}

# SIG # Begin signature block
# MIInogYJKoZIhvcNAQcCoIInkzCCJ48CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCA1HwyDFeHiXK3E
# lEPj+wpNXm/MOZNih5kulbh+qBUhN6CCDXYwggX0MIID3KADAgECAhMzAAACURR2
# zMWFg24LAAAAAAJRMA0GCSqGSIb3DQEBCwUAMH4xCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNpZ25p
# bmcgUENBIDIwMTEwHhcNMjEwOTAyMTgzMjU5WhcNMjIwOTAxMTgzMjU5WjB0MQsw
# CQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9u
# ZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMR4wHAYDVQQDExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB
# AQDBIpXR3b1IYAMunV9ZYBVYsaA7S64mqacKy/OJUf0Lr/LW/tWlJDzJH9nFAhs0
# zzSdQQcLhShOSTUxtlwZD9dnfIcx4pZgu0VHkqQw2dVc8Ob21GBo5sVrXgEAQxZo
# rlEuAl20KpSIFLUBwoZFGFSQNSMcqPudXOw+Mhvn6rXYv/pjXIjgBntn6p1f+0+C
# 2NXuFrIwjJIJd0erGefwMg//VqUTcRaj6SiCXSY6kjO1J9P8oaRQBHIOFEfLlXQ3
# a1ATlM7evCUvg3iBprpL+j1JMAUVv+87NRApprPyV75U/FKLlO2ioDbb69e3S725
# XQLW+/nJM4ihVQ0BHadh74/lAgMBAAGjggFzMIIBbzAfBgNVHSUEGDAWBgorBgEE
# AYI3TAgBBggrBgEFBQcDAzAdBgNVHQ4EFgQUMLgM7NX5EnpPfK5uU6FPvn2g/Ekw
# RQYDVR0RBD4wPKQ6MDgxHjAcBgNVBAsTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEW
# MBQGA1UEBRMNMjMwMDEyKzQ2NzU5NjAfBgNVHSMEGDAWgBRIbmTlUAXTgqoXNzci
# tW2oynUClTBUBgNVHR8ETTBLMEmgR6BFhkNodHRwOi8vd3d3Lm1pY3Jvc29mdC5j
# b20vcGtpb3BzL2NybC9NaWNDb2RTaWdQQ0EyMDExXzIwMTEtMDctMDguY3JsMGEG
# CCsGAQUFBwEBBFUwUzBRBggrBgEFBQcwAoZFaHR0cDovL3d3dy5taWNyb3NvZnQu
# Y29tL3BraW9wcy9jZXJ0cy9NaWNDb2RTaWdQQ0EyMDExXzIwMTEtMDctMDguY3J0
# MAwGA1UdEwEB/wQCMAAwDQYJKoZIhvcNAQELBQADggIBAIVJlff+Fp0ylEJhmvap
# NVv1bYLSWf58OqRRIDnXbHQ+FobsOwL83/ncPC3xl8ySR5uK/af4ZDy7DcDw0yEd
# mKbRLzHIfcztZVSrlsg0GKwZuaB2MEI1VizNCoZlN+HlFZa4DNm3J0LhTWrZjVR0
# M6V57cFW0GsV4NlqmtelT9JFEae7PomwgAV9xOScz8HzvbZeERcoSRp9eRsQwOw7
# 8XeCLeglqjUnz9gFM7RliCYP58Fgphtkht9LNEcErLOVW17m6/Dj75zg/IS+//6G
# FEK2oXnw5EIIWZraFHqSaee+NMgOw/R6bwB8qLv5ClOJEpGKA3XPJvS9YgOpF920
# Vu4Afqa5Rv5UJKrsxA7HOiuH4TwpkP3XQ801YLMp4LavXnvqNkX5lhFcITvb01GQ
# lcC5h+XfCv0L4hUum/QrFLavQXJ/vtirCnte5Bediqmjx3lswaTRbr/j+KX833A1
# l9NIJmdGFcVLXp1en3IWG/fjLIuP7BqPPaN7A1tzhWxL+xx9yw5vQiT1Yn14YGmw
# OzBYYLX0H9dKRLWMxMXGvo0PWEuXzYyrdDQExPf66Fq/EiRpZv2EYl2gbl9fxc3s
# qoIkyNlL1BCrvmzunkwt4cwvqWremUtqTJ2B53MbBHlf4RfvKz9NVuh5KHdr82AS
# MMjU4C8KNTqzgisqQdCy8unTMIIHejCCBWKgAwIBAgIKYQ6Q0gAAAAAAAzANBgkq
# hkiG9w0BAQsFADCBiDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24x
# EDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlv
# bjEyMDAGA1UEAxMpTWljcm9zb2Z0IFJvb3QgQ2VydGlmaWNhdGUgQXV0aG9yaXR5
# IDIwMTEwHhcNMTEwNzA4MjA1OTA5WhcNMjYwNzA4MjEwOTA5WjB+MQswCQYDVQQG
# EwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwG
# A1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSgwJgYDVQQDEx9NaWNyb3NvZnQg
# Q29kZSBTaWduaW5nIFBDQSAyMDExMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIIC
# CgKCAgEAq/D6chAcLq3YbqqCEE00uvK2WCGfQhsqa+laUKq4BjgaBEm6f8MMHt03
# a8YS2AvwOMKZBrDIOdUBFDFC04kNeWSHfpRgJGyvnkmc6Whe0t+bU7IKLMOv2akr
# rnoJr9eWWcpgGgXpZnboMlImEi/nqwhQz7NEt13YxC4Ddato88tt8zpcoRb0Rrrg
# OGSsbmQ1eKagYw8t00CT+OPeBw3VXHmlSSnnDb6gE3e+lD3v++MrWhAfTVYoonpy
# 4BI6t0le2O3tQ5GD2Xuye4Yb2T6xjF3oiU+EGvKhL1nkkDstrjNYxbc+/jLTswM9
# sbKvkjh+0p2ALPVOVpEhNSXDOW5kf1O6nA+tGSOEy/S6A4aN91/w0FK/jJSHvMAh
# dCVfGCi2zCcoOCWYOUo2z3yxkq4cI6epZuxhH2rhKEmdX4jiJV3TIUs+UsS1Vz8k
# A/DRelsv1SPjcF0PUUZ3s/gA4bysAoJf28AVs70b1FVL5zmhD+kjSbwYuER8ReTB
# w3J64HLnJN+/RpnF78IcV9uDjexNSTCnq47f7Fufr/zdsGbiwZeBe+3W7UvnSSmn
# Eyimp31ngOaKYnhfsi+E11ecXL93KCjx7W3DKI8sj0A3T8HhhUSJxAlMxdSlQy90
# lfdu+HggWCwTXWCVmj5PM4TasIgX3p5O9JawvEagbJjS4NaIjAsCAwEAAaOCAe0w
# ggHpMBAGCSsGAQQBgjcVAQQDAgEAMB0GA1UdDgQWBBRIbmTlUAXTgqoXNzcitW2o
# ynUClTAZBgkrBgEEAYI3FAIEDB4KAFMAdQBiAEMAQTALBgNVHQ8EBAMCAYYwDwYD
# VR0TAQH/BAUwAwEB/zAfBgNVHSMEGDAWgBRyLToCMZBDuRQFTuHqp8cx0SOJNDBa
# BgNVHR8EUzBRME+gTaBLhklodHRwOi8vY3JsLm1pY3Jvc29mdC5jb20vcGtpL2Ny
# bC9wcm9kdWN0cy9NaWNSb29DZXJBdXQyMDExXzIwMTFfMDNfMjIuY3JsMF4GCCsG
# AQUFBwEBBFIwUDBOBggrBgEFBQcwAoZCaHR0cDovL3d3dy5taWNyb3NvZnQuY29t
# L3BraS9jZXJ0cy9NaWNSb29DZXJBdXQyMDExXzIwMTFfMDNfMjIuY3J0MIGfBgNV
# HSAEgZcwgZQwgZEGCSsGAQQBgjcuAzCBgzA/BggrBgEFBQcCARYzaHR0cDovL3d3
# dy5taWNyb3NvZnQuY29tL3BraW9wcy9kb2NzL3ByaW1hcnljcHMuaHRtMEAGCCsG
# AQUFBwICMDQeMiAdAEwAZQBnAGEAbABfAHAAbwBsAGkAYwB5AF8AcwB0AGEAdABl
# AG0AZQBuAHQALiAdMA0GCSqGSIb3DQEBCwUAA4ICAQBn8oalmOBUeRou09h0ZyKb
# C5YR4WOSmUKWfdJ5DJDBZV8uLD74w3LRbYP+vj/oCso7v0epo/Np22O/IjWll11l
# hJB9i0ZQVdgMknzSGksc8zxCi1LQsP1r4z4HLimb5j0bpdS1HXeUOeLpZMlEPXh6
# I/MTfaaQdION9MsmAkYqwooQu6SpBQyb7Wj6aC6VoCo/KmtYSWMfCWluWpiW5IP0
# wI/zRive/DvQvTXvbiWu5a8n7dDd8w6vmSiXmE0OPQvyCInWH8MyGOLwxS3OW560
# STkKxgrCxq2u5bLZ2xWIUUVYODJxJxp/sfQn+N4sOiBpmLJZiWhub6e3dMNABQam
# ASooPoI/E01mC8CzTfXhj38cbxV9Rad25UAqZaPDXVJihsMdYzaXht/a8/jyFqGa
# J+HNpZfQ7l1jQeNbB5yHPgZ3BtEGsXUfFL5hYbXw3MYbBL7fQccOKO7eZS/sl/ah
# XJbYANahRr1Z85elCUtIEJmAH9AAKcWxm6U/RXceNcbSoqKfenoi+kiVH6v7RyOA
# 9Z74v2u3S5fi63V4GuzqN5l5GEv/1rMjaHXmr/r8i+sLgOppO6/8MO0ETI7f33Vt
# Y5E90Z1WTk+/gFcioXgRMiF670EKsT/7qMykXcGhiJtXcVZOSEXAQsmbdlsKgEhr
# /Xmfwb1tbWrJUnMTDXpQzTGCGYIwghl+AgEBMIGVMH4xCzAJBgNVBAYTAlVTMRMw
# EQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVN
# aWNyb3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNp
# Z25pbmcgUENBIDIwMTECEzMAAAJRFHbMxYWDbgsAAAAAAlEwDQYJYIZIAWUDBAIB
# BQCgga4wGQYJKoZIhvcNAQkDMQwGCisGAQQBgjcCAQQwHAYKKwYBBAGCNwIBCzEO
# MAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEIDHP48KQXhNrQjE8lMQHoBsl
# grWr2tSJ8SCaJcAk6qAYMEIGCisGAQQBgjcCAQwxNDAyoBSAEgBNAGkAYwByAG8A
# cwBvAGYAdKEagBhodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20wDQYJKoZIhvcNAQEB
# BQAEggEAv9NeAYAzwJxQ/jpikYKp87lNcWwpoDCsXohPC1mScr0gj9/oFqAvMEMY
# A/584TbQ/T4sKaLkv7BojjpRG+hHjG5WGIYhY0eSq+fEnkf82x/tSmHIyudMHSj1
# whu6bK10CQSGTpEGfPsLdjfyEOMJhumnAsScCQHZKeOkcJGKVpKiMZQuw0zWXSlG
# NYtlT9gbPQ8NTgRmYPLqkxyUIDUoZgHSU5bk9KK3IplFNKm1bq/z5QOx3TpkWRH2
# OspUUInyMyDiySI4pGhz1mL29eszcl+bQVF1ZJs9SKdat5A+hPw0U2kcL3usNSqe
# yAFPiiV9kFIFlvimusYQ/0bcGT/gvaGCFwwwghcIBgorBgEEAYI3AwMBMYIW+DCC
# FvQGCSqGSIb3DQEHAqCCFuUwghbhAgEDMQ8wDQYJYIZIAWUDBAIBBQAwggFVBgsq
# hkiG9w0BCRABBKCCAUQEggFAMIIBPAIBAQYKKwYBBAGEWQoDATAxMA0GCWCGSAFl
# AwQCAQUABCDtkK4chh3iDig+JjL8zZsbntjWjpc7iJFDseDptgbB5wIGYoTLRpfH
# GBMyMDIyMDYxNDE3MTY1NC43NzRaMASAAgH0oIHUpIHRMIHOMQswCQYDVQQGEwJV
# UzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UE
# ChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSkwJwYDVQQLEyBNaWNyb3NvZnQgT3Bl
# cmF0aW9ucyBQdWVydG8gUmljbzEmMCQGA1UECxMdVGhhbGVzIFRTUyBFU046Rjg3
# QS1FMzc0LUQ3QjkxJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1wIFNlcnZp
# Y2WgghFfMIIHEDCCBPigAwIBAgITMwAAAa6qC1yzNKWVGgABAAABrjANBgkqhkiG
# 9w0BAQsFADB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4G
# A1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYw
# JAYDVQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMDAeFw0yMjAzMDIx
# ODUxMzdaFw0yMzA1MTExODUxMzdaMIHOMQswCQYDVQQGEwJVUzETMBEGA1UECBMK
# V2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0
# IENvcnBvcmF0aW9uMSkwJwYDVQQLEyBNaWNyb3NvZnQgT3BlcmF0aW9ucyBQdWVy
# dG8gUmljbzEmMCQGA1UECxMdVGhhbGVzIFRTUyBFU046Rjg3QS1FMzc0LUQ3Qjkx
# JTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1wIFNlcnZpY2UwggIiMA0GCSqG
# SIb3DQEBAQUAA4ICDwAwggIKAoICAQCTjBrxITUMCx2nLc5z6WPCYOaiPELIKdJo
# Zdhts7VT6J6uILDjHubvaeX9ezyDNSl41GijZd3Y53KtvS4qpqp2ijkYIDxzRJO0
# PrWpeSMnPkvJP0d9YAhreKr0FagS0DYr8TrpFH2qRuNS03Sx3jOLsCJ5PkKxkB9i
# uMIzbYlKYqxdj3QnG5F8gCxKck9ka8MyZs3Jm3QrHGNDd0R8azHlkN5O7DbeNTQW
# Tk/uKQppMPFJICokiVzMyrN/DMVKsfzpUvNHSw0x3fmXotUtf6mwrUxszZtG4+qn
# 5JVDNyRQBdSS18ML6oGUXQ0FOttuMLRp8GpU2jiNEdHl/nK3D6VxgduxCIGFPtJa
# Nmh+/Uja7D1hHHQSAndMn4RVNp4lSXqRs5F3rSb2xcVt4je7HIy38P0ulFxe8LRM
# 3TjV1YiOT9lDO+/T+hCGfoPNRNjFl/F4y1cryLL88nJCeBRYvodcjxPr83JD8cxz
# rIi2mn7nLMjIwGgDPFsGvtNgboxDspXy0spNIr/SL0iPWZCVv4C70ONlNPlNN+WY
# VIQqmyhFhDCK9smtq2Ka1DBCnF3+Efey1TwX7CZ25DVLm6VAOCtYu4o0NaZFJbfm
# EP9+JrRMu3kooFaVc56n6zVXqwrxxuSMH3hVYTzWwMCupQRENvZzGI0V4+EC8r5i
# kZqjiTP8NQIDAQABo4IBNjCCATIwHQYDVR0OBBYEFNMwb9+/KGCKwamtdP787WQ6
# YVHuMB8GA1UdIwQYMBaAFJ+nFV0AXmJdg/Tl0mWnG1M1GelyMF8GA1UdHwRYMFYw
# VKBSoFCGTmh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2lvcHMvY3JsL01pY3Jv
# c29mdCUyMFRpbWUtU3RhbXAlMjBQQ0ElMjAyMDEwKDEpLmNybDBsBggrBgEFBQcB
# AQRgMF4wXAYIKwYBBQUHMAKGUGh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2lv
# cHMvY2VydHMvTWljcm9zb2Z0JTIwVGltZS1TdGFtcCUyMFBDQSUyMDIwMTAoMSku
# Y3J0MAwGA1UdEwEB/wQCMAAwEwYDVR0lBAwwCgYIKwYBBQUHAwgwDQYJKoZIhvcN
# AQELBQADggIBAF2/kfD9VQBEDjytMwMQAyFz+HCUJmq7Y1RSzBJC2Id/TxbVW7fO
# Eb9ENRkk2JoT/H/zjr55guXo8NzXNVUYu+K1hlCE79fFqq/HgbwEneHgwMRWwPJJ
# zjpv2ckpDAw2HW+u9/GkNMr6n+wFnIYD57QnP54TWqUiZo81JHuxL4wfHotAZ2NM
# ZfgEHEsSRv1Z7JvSMDnq/BNZolS2Hz5/XyA3Wmr9W6vYvoJ2X9YUu2qRqcW4rQia
# 9Shg+IyMgAZMR4XqDzoYbUJtbs5xO25SsR/KVO1tgPnqoILDZDN1QdJ680WQapuE
# pgUjYTj88t6Hzpi3ESv2paDgK+p3oYvIuZYZk4NS5DgMQoS8B75bogmPSvtryKbe
# PIqCv4frc+UYFXW/kvMcJ+9vJTfCj5JAdkWuYonK77YAOecElHYehRcV8Xkvm7IA
# Wsp+2cmn06QzOwUDgWMGqHbLlX+V4Bq8hsfOJOEefJj8Ad0NPQkQBrN+TTrek6z1
# 6nMpTbumc/MU0A3GiaeeKSsjqFuYiAxY6S53l0xI7VghQoAKOM26fQjSE6feyj53
# N4GVWjLxKVPEqe1WcDfXJEdlgysjow4ISHH7hSUyznZDrjCxrFj3Z2OonbVnNm1A
# 0GtkG85jUmchbYRKa8ENhpoGhmxirmFValI/2LdtRw9DwXgyOTGpfEnMMIIHcTCC
# BVmgAwIBAgITMwAAABXF52ueAptJmQAAAAAAFTANBgkqhkiG9w0BAQsFADCBiDEL
# MAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1v
# bmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEyMDAGA1UEAxMpTWlj
# cm9zb2Z0IFJvb3QgQ2VydGlmaWNhdGUgQXV0aG9yaXR5IDIwMTAwHhcNMjEwOTMw
# MTgyMjI1WhcNMzAwOTMwMTgzMjI1WjB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMK
# V2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0
# IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0Eg
# MjAxMDCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBAOThpkzntHIhC3mi
# y9ckeb0O1YLT/e6cBwfSqWxOdcjKNVf2AX9sSuDivbk+F2Az/1xPx2b3lVNxWuJ+
# Slr+uDZnhUYjDLWNE893MsAQGOhgfWpSg0S3po5GawcU88V29YZQ3MFEyHFcUTE3
# oAo4bo3t1w/YJlN8OWECesSq/XJprx2rrPY2vjUmZNqYO7oaezOtgFt+jBAcnVL+
# tuhiJdxqD89d9P6OU8/W7IVWTe/dvI2k45GPsjksUZzpcGkNyjYtcI4xyDUoveO0
# hyTD4MmPfrVUj9z6BVWYbWg7mka97aSueik3rMvrg0XnRm7KMtXAhjBcTyziYrLN
# ueKNiOSWrAFKu75xqRdbZ2De+JKRHh09/SDPc31BmkZ1zcRfNN0Sidb9pSB9fvzZ
# nkXftnIv231fgLrbqn427DZM9ituqBJR6L8FA6PRc6ZNN3SUHDSCD/AQ8rdHGO2n
# 6Jl8P0zbr17C89XYcz1DTsEzOUyOArxCaC4Q6oRRRuLRvWoYWmEBc8pnol7XKHYC
# 4jMYctenIPDC+hIK12NvDMk2ZItboKaDIV1fMHSRlJTYuVD5C4lh8zYGNRiER9vc
# G9H9stQcxWv2XFJRXRLbJbqvUAV6bMURHXLvjflSxIUXk8A8FdsaN8cIFRg/eKtF
# tvUeh17aj54WcmnGrnu3tz5q4i6tAgMBAAGjggHdMIIB2TASBgkrBgEEAYI3FQEE
# BQIDAQABMCMGCSsGAQQBgjcVAgQWBBQqp1L+ZMSavoKRPEY1Kc8Q/y8E7jAdBgNV
# HQ4EFgQUn6cVXQBeYl2D9OXSZacbUzUZ6XIwXAYDVR0gBFUwUzBRBgwrBgEEAYI3
# TIN9AQEwQTA/BggrBgEFBQcCARYzaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3Br
# aW9wcy9Eb2NzL1JlcG9zaXRvcnkuaHRtMBMGA1UdJQQMMAoGCCsGAQUFBwMIMBkG
# CSsGAQQBgjcUAgQMHgoAUwB1AGIAQwBBMAsGA1UdDwQEAwIBhjAPBgNVHRMBAf8E
# BTADAQH/MB8GA1UdIwQYMBaAFNX2VsuP6KJcYmjRPZSQW9fOmhjEMFYGA1UdHwRP
# ME0wS6BJoEeGRWh0dHA6Ly9jcmwubWljcm9zb2Z0LmNvbS9wa2kvY3JsL3Byb2R1
# Y3RzL01pY1Jvb0NlckF1dF8yMDEwLTA2LTIzLmNybDBaBggrBgEFBQcBAQROMEww
# SgYIKwYBBQUHMAKGPmh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2kvY2VydHMv
# TWljUm9vQ2VyQXV0XzIwMTAtMDYtMjMuY3J0MA0GCSqGSIb3DQEBCwUAA4ICAQCd
# VX38Kq3hLB9nATEkW+Geckv8qW/qXBS2Pk5HZHixBpOXPTEztTnXwnE2P9pkbHzQ
# dTltuw8x5MKP+2zRoZQYIu7pZmc6U03dmLq2HnjYNi6cqYJWAAOwBb6J6Gngugnu
# e99qb74py27YP0h1AdkY3m2CDPVtI1TkeFN1JFe53Z/zjj3G82jfZfakVqr3lbYo
# VSfQJL1AoL8ZthISEV09J+BAljis9/kpicO8F7BUhUKz/AyeixmJ5/ALaoHCgRlC
# GVJ1ijbCHcNhcy4sa3tuPywJeBTpkbKpW99Jo3QMvOyRgNI95ko+ZjtPu4b6MhrZ
# lvSP9pEB9s7GdP32THJvEKt1MMU0sHrYUP4KWN1APMdUbZ1jdEgssU5HLcEUBHG/
# ZPkkvnNtyo4JvbMBV0lUZNlz138eW0QBjloZkWsNn6Qo3GcZKCS6OEuabvshVGtq
# RRFHqfG3rsjoiV5PndLQTHa1V1QJsWkBRH58oWFsc/4Ku+xBZj1p/cvBQUl+fpO+
# y/g75LcVv7TOPqUxUYS8vwLBgqJ7Fx0ViY1w/ue10CgaiQuPNtq6TPmb/wrpNPgk
# NWcr4A245oyZ1uEi6vAnQj0llOZ0dFtq0Z4+7X6gMTN9vMvpe784cETRkPHIqzqK
# Oghif9lwY1NNje6CbaUFEMFxBmoQtB1VM1izoXBm8qGCAtIwggI7AgEBMIH8oYHU
# pIHRMIHOMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UE
# BxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSkwJwYD
# VQQLEyBNaWNyb3NvZnQgT3BlcmF0aW9ucyBQdWVydG8gUmljbzEmMCQGA1UECxMd
# VGhhbGVzIFRTUyBFU046Rjg3QS1FMzc0LUQ3QjkxJTAjBgNVBAMTHE1pY3Jvc29m
# dCBUaW1lLVN0YW1wIFNlcnZpY2WiIwoBATAHBgUrDgMCGgMVALyasJP8Z8nIFeRn
# cuW+CMBP01rjoIGDMIGApH4wfDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hp
# bmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jw
# b3JhdGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTAw
# DQYJKoZIhvcNAQEFBQACBQDmUuExMCIYDzIwMjIwNjE0MTQyODAxWhgPMjAyMjA2
# MTUxNDI4MDFaMHcwPQYKKwYBBAGEWQoEATEvMC0wCgIFAOZS4TECAQAwCgIBAAIC
# FfACAf8wBwIBAAICEQIwCgIFAOZUMrECAQAwNgYKKwYBBAGEWQoEAjEoMCYwDAYK
# KwYBBAGEWQoDAqAKMAgCAQACAwehIKEKMAgCAQACAwGGoDANBgkqhkiG9w0BAQUF
# AAOBgQClzpYnT5y707UXxS19qqh3I8R+Qh2uO0NybYKimBppcTroaFK6c5wFKtMk
# kDzKcSZ4tChPHlBEgX072tPwLMcESIOeYZfZfvUId4aC3qvbrokh7QM6iqWeuaJL
# Q6xo2dRLFswDFHJNduri0WwNFGRplBoDpveEM2MpKS7ZbjmRGjGCBA0wggQJAgEB
# MIGTMHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQH
# EwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNV
# BAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwAhMzAAABrqoLXLM0pZUa
# AAEAAAGuMA0GCWCGSAFlAwQCAQUAoIIBSjAaBgkqhkiG9w0BCQMxDQYLKoZIhvcN
# AQkQAQQwLwYJKoZIhvcNAQkEMSIEIAmk0Hb8d3oStHEuXpAl1Nt3K/vXONOv/ea1
# i8zvzV+0MIH6BgsqhkiG9w0BCRACLzGB6jCB5zCB5DCBvQQgSSgdPriMw1qh7p9P
# Zqk1PLjoOrXsNMrtbkNIlPxSb2gwgZgwgYCkfjB8MQswCQYDVQQGEwJVUzETMBEG
# A1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWlj
# cm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQgVGltZS1TdGFt
# cCBQQ0EgMjAxMAITMwAAAa6qC1yzNKWVGgABAAABrjAiBCABFUGTgnSc/ZxFoE64
# dlzFFFeRmEIi60Kh5YtATizwYjANBgkqhkiG9w0BAQsFAASCAgAuWWYktQqLkYdo
# 7ce9sUkEjYXIuXjdw3w0GcmEoJ2MHW75bAUIgmkkUzGzCtyxQ7an0oNbtBoO3fhe
# vrb13Y7F4nVximmAYmZMfjtIG0zOVWmywdaFIHWwNZ6zvfb62KZhK1k1p1XW7NwC
# Ofvjyv/CzFnH4hQAVdrNGiEiFqcUM3DdnkSQFVkjUWzYrpcQlg3WC/KCpnm25rNX
# SADQeVd3bo1LTaVmXza5eHQ6Vtd1ndMVQXOfo18TMWVWsQ52sX9CreUULz73xSo4
# H1uuddFbJqVErFo6iMYJ9ug9jiVUbB9OQtVUZiqH49rk+E1ZIovU8zwyWA5ODEeL
# Y+lho2CVeS/4A5MEl68jbj7MT06c0ufBaOCJ2bPuX5eY7MeOApIpTsNPvjnNAdrf
# Dr3atbgPPxnI2LnMi1OVydGEoLc2t25C6TcMYfGh/eDjbbzby1iOPHUxHV9G6nmu
# 4PTBptyXbIj9oscYrwWPraMRqm4KRtrDHaf4+5n8ljRKtLZGGImuZv8d/N9iOxRp
# QlbZYcLwKIOCeV8gj43gGKB7+N/RnFpLKuz9frqpLU1vRWQVXiQELLUNFuiYZgOg
# aI58pwZzPQMxo2IQgtCoFD2vRifJiKN67rzwqZj6LRAK64UZCZs2Pf2Nbg2yQWYw
# KAdpAXqIqMkN/ViEo/UiD0GSi1lhIA==
# SIG # End signature block
