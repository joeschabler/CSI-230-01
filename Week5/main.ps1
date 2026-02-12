. .\gatherClasses.ps1
. .\dayTranslator.ps1

$FullTable = gatherClasses

$FullTable = dayTranslator($FullTable)

# i) List all the classes of the instructor Furkan Paligu
#$FullTable | Select-Object "Class Code", Instructor, Location, Days, "Time Start", "Time End" `
#           | Where-Object { $_.Instructor -like "Furkan*" }

# ii) List all the classes of FREE 105 on Wednesdays, only display Class Code and Times. 
#$FullTable | Where-Object { ($_.Location -ilike "FREE 105") -and ($_.Days -contains "Wednesday") } `
#            | Sort-Object {[DateTime]$_."Time Start"} `
 #          | Format-Table "Time Start", "Time End", "Class Code"

#iii) Make a list of all the instructors that teach at least 1 course in one of the courses: SYS, NET, SEC, FOR, CSI, DAT. 
#Sort by name and make it unique
$ITSInstructors = $FullTable | Where-Object { ($_."Class Code" -ilike "SYS*") -or `
                            ($_."Class Code" -ilike "NET*") -or `
                            ($_."Class Code" -ilike "SEC*") -or `
                            ($_."Class Code" -ilike "FOR*") -or `
                            ($_."Class Code" -ilike "CSI*") -or `
                            ($_."Class Code" -ilike "DAT*") } `
           | Sort-Object "Instructor" `
           | Select-Object "Instructor" -Unique
#$ITSInstructors
#iv) Group all the instructors by the number of classes they are teaching
$FullTable | Where-Object { $_.Instructor -in $ITSInstructors.Instructor } `
           | Group-Object "Instructor" | Select-Object Count, Name | Sort-Object Count -Descending
