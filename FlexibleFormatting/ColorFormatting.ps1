Write-FormatView -TypeName ColorizedRow -Property Number, IsEven, IsOdd -AutoSize -ColorRow {if ($_.N % 2) { "#ff0000"} else {"#0f0"} } -VirtualProperty @{
    IsEven = { -not ($_.N % 2)}
    IsOdd = { ($_.N % 2) -as [bool] }
} -AliasProperty @{
    Number = 'N'
} | 
    Out-FormatData | 
    Add-FormatData

foreach ($n in 1..5) {
    [PSCustomObject]@{
        PSTypeName='ColorizedRow'
        N = $n
    }
}