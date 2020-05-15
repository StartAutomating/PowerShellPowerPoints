Write-FormatView -TypeName System.TimeZoneInfo -Property Name, '∆UTC' -AutoSize -VirtualProperty @{
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
} -AlignProperty @{Name='Right'}|
    Out-FormatData |
    Add-FormatData 


Get-TimeZone -ListAvailable
