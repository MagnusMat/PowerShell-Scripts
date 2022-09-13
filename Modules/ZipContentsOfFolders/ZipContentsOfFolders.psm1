function ZipContentsOfFolders {
    foreach ($file in Get-ChildItem .) {
        Set-Location $file.FullName;
        $zippath = -Join ($file.FullName, ".zip");
        7z.exe a $zippath *;
        Set-Location ..
    }
}

Export-ModuleMember -Function ZipContentsOfFolders
