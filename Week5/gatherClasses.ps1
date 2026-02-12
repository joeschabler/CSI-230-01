function gatherClasses()
{
    $ErrorActionPreference = "SilentlyContinue"
    $page = Invoke-WebRequest -TimeoutSec 2 http://10.0.17.46/Courses2026SP.html

    $trs=$page.ParsedHtml.body.getElementsByTagName("tr")

    $FullTable = @()
    for($i=1; $i -lt $trs.length; $i++)
    {
    
        $tds = $trs[$i].getElementsByTagName("td")

        $times = $tds[5].innerText.split("-")

        $FullTable += [pscustomobject]@{"Class Code" = $tds[0].innerText; `
                                        "Title"      = $tds[1].innerText; `
                                        "Days"       = $tds[4].innerText; `
                                        "Time Start" = $times[0].Trim() -replace '([AP]M)', ' $1'; `
                                        "Time End"   = $times[1].Trim() -replace '([AP]M)', ' $1'; `
                                        "Instructor" = $tds[6].innerText; `
                                        "Location"   = $tds[9].innerText; `
                                        }
}
return $FullTable
}

    


