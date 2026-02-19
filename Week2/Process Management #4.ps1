if (Get-Process -Name "chrome" -ErrorAction SilentlyContinue) {
    Stop-Process -Name "chrome" -Force
    Write-Host "Google Chrome was running and has been stopped."
}
else {
    Start-Process "chrome.exe" "https://www.champlain.edu/"
    Write-Host "Google Chrome was not running. Starting now and directing to champlain.edu"
}