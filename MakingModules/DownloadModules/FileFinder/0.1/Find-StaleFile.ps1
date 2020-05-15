function Find-StaleFile
{
    <#
    .Synopsis
        Finds stale files
    .Description
        Finds stale files.  By default, finds files that have not been written to in over a year.
    #>
    param(
    # The root path
    [Parameter(Mandatory)]
    [ValidateScript({
        return . $validateRootPath
    })]
    [string]
    $RootPath,

    # The date at which a file is considered "Stale".  
    # By default, these are files written to over a year ago
    [DateTime]
    $StaleTime = $([DateTime]::Now.addYears(-1))
    )

    Get-ChildItem -Path $RootPath -Recurse -Force |
        Where-Object {
            $_.LastWriteTime -le $StaleTime
        }
}
