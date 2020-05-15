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
