Write-FormatView -TypeName System.TimeZoneInfo -Property BaseUtcOffset, Id -AutoSize |
    Out-FormatData |
    Add-FormatData 


Get-TimeZone -ListAvailable
