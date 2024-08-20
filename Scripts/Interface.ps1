Write-OutPut "`nDO NOT ENTER MUSIC URLS"
while($UserInput -ne ""){
    $UserInput = Read-Host "Enter INFORMATIONAL URL, one at a time. type nothing and press enter to finish`n"
    $InfoURL = "$($UserInput) $($InfoURL)"  
}
$InfoURL

Write-OutPut "`nDO NOT ENTER INFORMATIONAL URLS"
while($UserInput2 -ne ""){
    $UserInput2 = Read-Host "Enter MUSIC URL, one at a time. type nothing and press enter to finish`n"
    $MUSICURL = "$($UserInput2) $($MUSICURL)"  
}
$MUSICURL


$CombinedURL = "$InfoURL$MUSICURL"
./DownRand -URL $CombinedURL