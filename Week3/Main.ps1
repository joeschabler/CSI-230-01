$PSScriptRoot = "C:\Users\champuser\Desktop\GitHub Push\Week3"
. (Join-Path $PSScriptRoot Event-Logs.ps1)

clear

$loginoutsTable = getUserLoginOuts 15
$loginoutsTable

$shutdownsTable = getUserShutdowns 25 6006
$shutdownsTable

$startUpsTable = getUserShutdowns 25 6005
$startUpsTable