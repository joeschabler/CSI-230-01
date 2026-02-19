<# String-Helper
*************************************************************
   This script contains functions that help with String/Match/Search
   operations. 
************************************************************* 
#>


<# ******************************************************
   Functions: Get Matching Lines
   Input:   1) Text with multiple lines  
            2) Keyword
   Output:  1) Array of lines that contain the keyword
********************************************************* #>
function getMatchingLines($contents, $lookline){

$allines = @()
$splitted =  $contents.split([Environment]::NewLine)

for($j=0; $j -lt $splitted.Count; $j++){  
 
   if($splitted[$j].Length -gt 0){  
        if($splitted[$j] -ilike $lookline){ $allines += $splitted[$j] }
   }

}

return $allines
}

function checkPassword($securePassword){
    
    $password = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto(
        [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($securePassword)
    )

    $length     = $password.Length
    $hasLetter  = $password -match '[a-zA-Z]'
    $hasNumber  = $password -match '\d'
    $hasSpecial = $password -match '[^a-zA-Z0-9]'
    if($length -lt 6){
       return $false
    }
    elseif(!$hasLetter -or !$hasNumber -or !$hasSpecial){
        return $false
    }
    else{
        return $true
    }
}