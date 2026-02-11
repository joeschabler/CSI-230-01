. .\ApacheLogFunction.ps1

$tableRecords = ApacheLogs1

Write-Host ($tableRecords | Format-Table -AutoSize | Out-String)

Write-Host ($tableRecords | Where-Object { $_.Page -like "*page2.html*" -and $_.Referrer -like "*index.html*" } |
                                         Format-Table -AutoSize | Out-String)