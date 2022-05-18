function FrameRangeOfVideo {
    param ([string]$videoFile, [int]$start, [int]$end)

    ffmpeg -i $videoFile.mp4 -vf select='between(n\,$start\,$end)' -vsync 0 $videoFile%d.png;
}

Export-ModuleMember -Function FrameRangeOfVideo
