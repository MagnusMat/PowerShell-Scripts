<#
 .Synopsis
  Allows for compressing and converting image files.

 .Description
  Allows for compressing and converting image files.
  This uses FFMPEG and supports alomst all image file types.

 .Parameter fileType
  [String] Target files of this type.
  Leave blank or use "*" for all file types.

 .Parameter newType
  [String] Convert to this file type.
  Leave blank to keep same file type after compression.

 .Parameter appendText
  [String] Append this text to the end of the file name.
  Leave blank for no text appended.

 .Example
   # Convert all .png files in a folder to .webp.
   CompressImages -fileType ".png" -newType ".webp"

 .Example
   # Compress all files in a folder.
   CompressImages -fileType "*"

 .Example
   # Add comp to the end of all files after compression.
   CompressImages -fileType "*" -appendText "comp"
#>

function CompressImages {
  param([string]$fileType = "*", [string]$newType, [string]$appendText = "")

  foreach ($i in Get-ChildItem -filter "*$fileType" $Folder) {
    $noExtension = ([io.fileinfo]"$i").BaseName;
    $baseExtension = ([io.fileinfo]"$i").Extension;

    if ("$newType" -eq "" -or $null) {
        $newType = $baseExtension
    }

    ffmpeg -i "$i" "$noExtension$appendText$newType"
  }
}

Export-ModuleMember -Function CompressImages
