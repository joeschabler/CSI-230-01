. "C:\Users\champuser\Desktop\GitHub Push\Week6\Local_User_Management\Event-Logs.ps1"
. "C:\Users\champuser\Desktop\GitHub Push\Week7\Email.ps1"
. "C:\Users\champuser\Desktop\GitHub Push\Week7\Configuration.ps1"
. "C:\Users\champuser\Desktop\GitHub Push\Week7\Scheduler.ps1"

$configuration = readConfiguration

$Failed = getRiskyUsers $configuration.Days

SendAlertEmail ($Failed | Format-Table | Out-String)

ChooseTimeToRun $configuration.ExecutionTime