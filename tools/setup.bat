;@Findstr -bv ;@F "%~f0" | powershell -Command - & pause & goto:eof

# Unzip backwards compatibility (Windows 8)
Add-Type -AssemblyName System.IO.Compression.FileSystem
function Unzip {
    param([string]$zipfile, [string]$outpath)
    [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
}

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$client = New-Object Net.WebClient
Write-Output "=> Downloading ..."
$client.DownloadFile("https://github.com/BrettMayson/HEMTT/releases/download/v1.3.1/windows-x64.zip", "hemtt.zip")
$client.dispose()

Write-Output "=> Cleaning old ..."
If (Test-Path "..\hemtt.exe") {
    Remove-Item -Force "..\hemtt.exe"
}

Write-Output "=> Extracting ..."
Unzip "hemtt.zip" "..\."
Remove-Item "hemtt.zip"

Write-Output "Tools successfully installed to project!"
