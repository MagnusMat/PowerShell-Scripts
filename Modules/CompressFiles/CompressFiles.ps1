function CompressImages {
    param([string]$filetype)

    foreach ($i in Get-ChildItem -filter "*.$filetype" $SomeFolder) {
        $noExtension = ([io.fileinfo]"$i").basename

        if ($filetype -eq "png") {
            ffmpeg -i "$i" -compression_level 100 "$noExtension comp.png"
        }
        else {
            ffmpeg -i "$i" "$noExtension comp.jpg"
        }
    }
}

function FirstFrameOfVideo {
    param ([string]$videoFile)

    ffmpeg -i $videoFile.mp4 -vframes 1 -f image2 $videoFile.jpg;
}

function FrameRangeOfVideo{
    param ([string]$videoFile, [int]$start, [int]$end)

    ffmpeg -i $videoFile.mp4 -vf select='between(n\,$start\,$end)' -vsync 0 $videoFile%d.png;
}