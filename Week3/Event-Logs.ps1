function getUserLoginOuts($days){    
    
    $loginOuts = Get-EventLog -LogName System -Source Microsoft-Windows-Winlogon -After (Get-Date).AddDays(-$days)

    $loginOutsTable = @()
    for($i=0; $i -lt $loginOuts.count; $i++){

    $event = ""
    if($loginOuts[$i].InstanceID -eq 7001) {$event = "Logon"}
    if($loginOuts[$i].InstanceID -eq 7002) {$event = "Logoff"}

    $user = $loginOuts[$i].ReplacementStrings[1]
    $username = ([System.Security.Principal.SecurityIdentifier]$user).Translate([System.Security.Principal.NTAccount]).Value

    $loginOutsTable += [pscustomobject]@{"Time" = $loginOuts[$i].TimeGenerated;
                                         "Id" = $loginOuts[$i].InstanceID;
                                         "Event" = $event;
                                         "User" = $username;}


    }

    $loginOutsTable
}

function getUserShutdowns($days, $eventId){    
    
    $shutdowns = Get-EventLog -LogName System -After (Get-Date).AddDays(-$days) | 
    Where-Object {$_.EventID -eq $eventID}

    $shutdownsTable = @()
    for($i=0; $i -lt $shutdowns.count; $i++){

    $event = ""
    if($shutdowns[$i].EventID -eq 6006) {$event = "Shutdown"}
    if($shutdowns[$i].EventID -eq 6005) {$event = "Start Up"}

    $shutdownsTable += [pscustomobject]@{"Time" = $shutdowns[$i].TimeGenerated;
                                         "Id" = $shutdowns[$i].EventID;
                                         "Event" = $event;
                                         "User" = "System";}


    }

    $shutdownsTable
}


