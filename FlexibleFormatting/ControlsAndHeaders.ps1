@(
Write-FormatControl -Name MyHeader -Action {
    "This is my header.  Content is below.  If this were a real control, you could use this space to provide some helper text."
}

Write-FormatControl -Name Star -Action {
    "*"
}

Write-FormatView -GroupAction MyHeader -GroupByScript { 1 } -TypeName StarN -Action {
    Write-FormatViewExpression -ScriptBlock { 1..($_.N) } -ControlName Star -Enumerate
}

) | Out-FormatData | 
    Add-FormatData


foreach ($n in 1..10) {
    [PSCustomObject]@{PSTypeName='StarN';n=$n}
}