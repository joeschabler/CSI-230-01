function ApacheLogs1 
{

$logPath = "C:\xampp\apache\logs\access.log"
$rawLogs = Get-Content $logPath

$results = foreach ($line in $rawLogs)
{
        $parts = $line.Split(" ")

        $referrerValue = if ($parts.Count -gt 10) { $parts[10].Replace('"','') } else { "-" }

        [PSCustomObject]@{
                IP       = $parts[0]
                Time     = $parts[3].TrimStart('[')
                Method   = $parts[5].TrimStart('"')
                Page     = $parts[6]
                Protocol = $parts[7].TrimEnd('"')
                Response = $parts[8]
                Referrer = $referrerValue
            }
        }
    $filteredResults = $results | Where-Object { $_.IP -ilike "10.*" }
    
    return $filteredResults
}

