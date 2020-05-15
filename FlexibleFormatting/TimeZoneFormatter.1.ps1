Write-FormatView -TypeName System.TimeZoneInfo -Property DisplayName |
    Out-FormatData |
    Add-FormatData 


Get-TimeZone -ListAvailable
