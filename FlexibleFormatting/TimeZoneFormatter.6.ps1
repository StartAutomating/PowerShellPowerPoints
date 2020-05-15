Write-FormatView -TypeName System.TimeZoneInfo -Property Name, '∆UTC', LocalTime -AutoSize -VirtualProperty @{
    Name = {
        $tz = $_
        if ($tz.SupportsDaylightSavingTime) {
            if ($tz.IsDaylightSavingTime([DateTime]::Now)) {
                $tz.DaylightName
            } else {
                $tz.StandardName
            }
        } else {
            $tz.StandardName
        }
    }
    '∆UTC'= {
        $_.GetUtcOffSet([DateTime]::Now)
    }
    'LocalTime' = {
        ([DateTime]::UtcNow + $_.GetUtcOffset([DateTime]::UtcNow)).ToShortTimeString()
    }
} -AlignProperty @{Name='Right'}|
    Out-FormatData |
    Add-FormatData 


Get-TimeZone -ListAvailable
