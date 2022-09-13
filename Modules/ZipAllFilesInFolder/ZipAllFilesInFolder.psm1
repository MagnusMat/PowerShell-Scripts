function ZipAllFilesInFolder {
    param ([string]$location)

    foreach ($file in Get-ChildItem $location) {
        7z.exe a $file.FullName $file.FullName
    }
}

Export-ModuleMember -Function ZipAllFilesInFolder
