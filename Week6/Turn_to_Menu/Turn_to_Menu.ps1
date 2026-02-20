. (& { Join-Path $PSScriptRoot "..\..\Week2\Process Management #4.ps1" })
. (& { Join-Path $PSScriptRoot "..\Local_User_Management\Event-Logs.ps1"})
. (& { Join-Path $PSScriptRoot "..\..\Week4\ApacheLogFunction.ps1"})

clear

$Prompt = "`n"
$Prompt += "Please choose your operation:`n"
$Prompt += "1  - Display last 10 apache logs `n"
$Prompt += "2  - Display last 10 failed logins for all users`n"
$Prompt += "3  - Display at risk users`n"
$Prompt += "4  - Start Chrome web browser and navigate it to champlain.edu - if no instances of Chrome is running`n"
$Prompt += "5  - Exit`n"

$operation = $true

while($operation){

    
    Write-Host $Prompt | Out-String
    $choice = Read-Host 
    
    if($choice -eq 1){
        $logs = ApacheLogs1 | Select-Object -Last 10
        $logs | Format-Table
    }

    elseif($choice -eq 2){
        $days = Read-Host "How many days back should we check for failed logins?"
        $failed = getFailedLogins $days | Select-Object -First 10
        $failed | Format-Table
    }

    elseif($choice -eq 3){
        getRiskyUsers
    }

    elseif($choice -eq 4){
        champlainEduOnlyOpen
    }

    elseif($choice -eq 5){
        Write-Host "Goodbye" | Out-String
        exit
        $operation = $false 
    }
    
    else {
        Write-Host "Invalid selection: '$choice'. Please enter a number between 1 and 5." | Out-String
    }
}

