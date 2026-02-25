function readConfiguration() {
    $configFile = Join-Path -Path $PSScriptRoot -ChildPath "configuration.txt"
    
    if (-not (Test-Path $configFile)) {
        Write-Error "Configuration file not found at $configFile"
        return
    }


    $lines = Get-Content -Path $configFile -TotalCount 2

    $configData = [pscustomobject]@{
        Days = $lines[0] #days
        ExecutionTime = $lines[1] #time
    }
    return $configData
}

function changeConfiguration() {
    $configFile = Join-Path -Path $PSScriptRoot -ChildPath "configuration.txt"
    Write-Host "How many days of logs would you like?" | Out-String
        $days = Read-Host
        $inputInvalid = $True
        while($inputInvalid){
            if($Days -match "^\d+$") {$inputInvalid = $false}
            else{
                Write-Host "Input must only contain digits. How many days of logs would you like?"
                $days = Read-Host
            }
        }
        Write-Host "What time would you like the task to be executed? (Format: HR:MM AM/PM)" | Out-String
        $time = Read-Host
        $inputInvalid = $True
        while($inputInvalid){
            if($time -cmatch "^(1[0-2]|0?[1-9]):[0-5][0-9]\s(AM|PM)$") {$inputInvalid = $false}
            else {
                Write-Host "Input must match format. What time would you like the task to be executed? (Format: HR:MM AM/PM)"
                $time = Read-Host
            }
        }
        Set-Content -Path $PSRootScript$configFile -Value @($days, $time)
        Write-Host "Configuration Changed" | Out-String
}

function configurationMenu() {
    clear

    $Prompt = "`n"
    $Prompt += "Please choose your operation:`n"
    $Prompt += "1  - Show Configuration`n"
    $Prompt += "2  - Change Configuration`n"
    $Prompt += "3  - Exit`n"

    $operation = $true

    while($operation){

    
        Write-Host $Prompt | Out-String
        $choice = Read-Host 


        if($choice -eq 1){
            $config = readConfiguration
            $config | Format-Table
        }
        elseif($choice -eq 2){
            changeConfiguration
        }
        elseif($choice -eq 3){
            Write-Host "Goodbye" | Out-String
            exit
            $operation = $false 
        }
        else{
            Write-Host "Invalid selection: '$choice'. Please enter a number between 1 and 3." | Out-String
        }


    }
}