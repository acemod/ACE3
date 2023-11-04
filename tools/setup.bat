;@Findstr -bv ;@F "%~f0" | powershell -Command - & pause & goto:eof

Write-Output "=> Downloading ..."
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$url = "https://github.com/BrettMayson/HEMTT/releases/latest/download/windows-x64.zip"
(New-Object Net.WebClient).DownloadFile($url, "hemtt.zip"); Write-Output "$url => hemtt.zip"

Write-Output "`n=> Extracting ..."
Expand-Archive -Path "hemtt.zip" -DestinationPath "..\." -Force; Write-Output "hemtt.zip"
Remove-Item "hemtt.zip"

Write-Output "`n=> Verifying ..."
Start-Process -FilePath ..\hemtt.exe -ArgumentList --version -NoNewWindow -Wait

Write-Output "`nTools successfully installed to project!"
