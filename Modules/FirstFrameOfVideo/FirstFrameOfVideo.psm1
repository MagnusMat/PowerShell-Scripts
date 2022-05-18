function FirstFrameOfVideo {
    param ([string]$videoFile)

    ffmpeg -i $videoFile.mp4 -vframes 1 -f image2 $videoFile.jpg;
}

Export-ModuleMember -Function FirstFrameOfVideo
