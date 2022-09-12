function ZipAllFilesInFolder {
    param ([string]$location)

    foreach ($file in Get-ChildItem $location) {
        Compress-Archive $file.FullName $file.FullName
    }
}

Export-ModuleMember -Function ZipAllFilesInFolder
