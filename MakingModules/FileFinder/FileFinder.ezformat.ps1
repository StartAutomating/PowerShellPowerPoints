#requires -Module EZOut
#  Install-Module EZOut or https://github.com/StartAutomating/EZOut
$myFile = $MyInvocation.MyCommand.ScriptBlock.File
$myModuleName = $($myFile | Split-Path -Leaf) -replace '\.ezformat\.ps1', ''
$myRoot = $myFile | Split-Path
$formatting = @(
    # Write-FormatView
    Write-FormatView -TypeName Big.File -Property Name, Length -VirtualProperty @{
        'Length' = {
            '' + [Math]::Round($_.Length / 1mb) + 'mb' 
         }
    }

)
if ($formatting) {
    $myFormatFile = Join-Path $myRoot "$myModuleName.format.ps1xml"
    $formatting | Out-FormatData | Set-Content $myFormatFile -Encoding UTF8
}
$types = @(
    # Write-TypeView
)

if ($types) {
    $myTypesFile = Join-Path $myRoot "$myModuleName.types.ps1xml"
    $types | Out-TypeData | Set-Content $myTypesFile -Encoding UTF8
}
