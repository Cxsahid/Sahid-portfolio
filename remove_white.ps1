Add-Type -AssemblyName System.Drawing

$inputFile = "C:\portfolio-template\images\profile_cutout.jpg"
$outputFile = "C:\portfolio-template\images\profile_transparent.png"

$img = [System.Drawing.Bitmap]::FromFile($inputFile)
$bmp = New-Object System.Drawing.Bitmap($img.Width, $img.Height)

for ($x = 0; $x -lt $bmp.Width; $x++) {
    for ($y = 0; $y -lt $bmp.Height; $y++) {
        $c = $img.GetPixel($x, $y)
        # Tolerance for near-white pixels due to JPEG compression
        if ($c.R -gt 230 -and $c.G -gt 230 -and $c.B -gt 230) {
            $bmp.SetPixel($x, $y, [System.Drawing.Color]::Transparent)
        } else {
            $bmp.SetPixel($x, $y, $c)
        }
    }
}

$bmp.Save($outputFile, [System.Drawing.Imaging.ImageFormat]::Png)

$img.Dispose()
$bmp.Dispose()
Write-Host "Success! Created transparent PNG."
