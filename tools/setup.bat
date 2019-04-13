;@Findstr -bv ;@F "%~f0" | powershell -command - & goto:eof

$VERSION = "0.6.0"
$ARCH = if ([Environment]::Is64BitProcess) {"x86_64"} else {"i686"}

Add-Type -AssemblyName System.IO.Compression.FileSystem
function Unzip {
    param([string]$zipfile, [string]$outpath)

    [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
}

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$client = New-Object Net.WebClient

Write-Output "=> Downloading HEMTT..."
$client.DownloadFile("https://github.com/synixebrett/HEMTT/releases/download/v$VERSION/hemtt-v$VERSION-$ARCH-pc-windows-msvc.zip", "hemtt-v$VERSION-$ARCH-pc-windows-msvc.zip")
$client.dispose()

Write-Output "=> Extracting HEMTT..."
Unzip "hemtt-v$VERSION-$ARCH-pc-windows-msvc.zip" "..\."
Remove-Item "hemtt-v$VERSION-$ARCH-pc-windows-msvc.zip"

Write-Output "=> Updating HEMTT..."
& ..\hemtt.exe update
