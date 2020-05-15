Write-FormatView -TypeName System.TimeZoneInfo -Action {
    @(
        '{0:t}' -f $_.LocalTime
        $_.Name
        '[' + $_.UTCOffSet +'Z]'
    ) -join ' '
}

Write-FormatView -TypeName System.TimeZoneInfo -Property Name, '∆UTC', LocalTime -AutoSize -AliasProperty @{
    '∆UTC'= 'UTCOffset'

} -AlignProperty @{Name='Right'} -FormatProperty @{
    'LocalTime' = '{0:t}'
}

Write-FormatView -TypeName System.TimeZoneInfo -Property Name, UTCOffset, LocalTime -AsList

Write-FormatWideView -Property Name -AutoSize |
    Write-FormatView -TypeName System.TimeZoneInfo -FormatXML { $_} 
