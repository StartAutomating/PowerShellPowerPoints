Write-FormatView -TypeName System.TimeZoneInfo -Property UTCOffset, ID -AutoSize -AliasProperty @{
    UTCOffset='BaseUTCOffset'
}|
    Out-FormatData |
    Add-FormatData 


Get-TimeZone -ListAvailable
