#requires -Module Pester
describe FileFinder {
    it 'Can find big files' {
        $bigFiles = @(Find-BigFile -RootPath $pwd) 
        $bigFiles.Count | should be 0 
    }
}