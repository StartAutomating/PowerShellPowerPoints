Write-FormatView -TypeName System.TimeZoneInfo -Property BaseUtcOffset, Id |
    Out-FormatData |
    Add-FormatData 


Get-TimeZone -ListAvailable
