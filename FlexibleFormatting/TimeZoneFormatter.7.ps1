Write-TypeView -TypeName System.TimeZoneInfo -ScriptProperty @{
    Name = {
        $tz = $this
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
    UTCOffset = {
        $this.GetUtcOffset([DateTime]::Now)
    }
    LocalTime = {
        ([DateTime]::UtcNow + $_.GetUtcOffset([DateTime]::UtcNow))
    }
} |
    Out-TypeData |
    Add-TypeData -Name TimeZoneTypes


Write-FormatView -TypeName System.TimeZoneInfo -Property Name, '∆UTC', LocalTime -AutoSize -AliasProperty @{
    '∆UTC'= 'UTCOffset'

} -AlignProperty @{Name='Right'} -FormatProperty @{
    'LocalTime' = '{0:t}'
}|
    Out-FormatData |
    Add-FormatData -Name TimeZoneFormats 


Get-TimeZone -ListAvailable
