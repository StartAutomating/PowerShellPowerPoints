function Find-FreshFile
{
    <#
    .Synopsis
        Finds fresh files
    .Description
        Finds fresh files.  By default, finds files that have been written to in the past month.
    #>
    param(
    # The root path
    [Parameter(Mandatory)]
    [ValidateScript({
        return . $validateRootPath
    })]
    [string]
    $RootPath,

    # The cutoff date at which a file is considered "Old".  
    # By default, these are files written to within a month.
    [DateTime]
    $NewerThan = $([DateTime]::Now.addMonths(-1))
    )

    Get-ChildItem -Path $RootPath -Recurse -Force |
        Where-Object {
            $_.CreationTime -gt $LastTouchTime
        }
}
