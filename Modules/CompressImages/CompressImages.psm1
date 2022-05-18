function CompressImages {
    param([string]$filetype, [string]$newType)

    foreach ($i in Get-ChildItem -filter "*.$filetype" $SomeFolder) {
        $noExtension = ([io.fileinfo]"$i").basename;

        Write-Output $noExtension
        Write-Output $filetype
        Write-Output $i

        if ("$filetype" -eq "png") {
            ffmpeg -i "$i" -compression_level 100 "$noExtension comp.png"
        }
        else {
            ffmpeg -i "$i" "$noExtension comp.$newType"
        }
    }
}

Export-ModuleMember -Function CompressImages
