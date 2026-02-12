function dayTranslator($FullTable)
{
    for($i=0; $i -lt $FullTable.length; $i++)
    {
        $days = @()

        if($FullTable[$i].Days -ilike "M*"){ $days += "Monday"}
        
        if($FullTable[$i].Days -ilike "*T[WF]"){ $days += "Tuesday"}
        ElseIf($FullTable[$i].Days -ilike "T"){ $days += "Tuesday"}

        if($FullTable[$i].Days -ilike "*W*"){ $days += "Wednesday"}

        if($FullTable[$i].Days -ilike "*TH*"){ $days += "Thursday"}

        if($FullTable[$i].Days -ilike "*F"){ $days += "Friday"}

        $FullTable[$i].Days = $days
    }
    return $FullTable
}