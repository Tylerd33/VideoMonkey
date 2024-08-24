#Paramater acts as boolean, only use if testing
param(
    [string]$test
)



#If test parameter input then skip input phase, used for testing only

if($test){
    $CombinedURL = "https://www.youtube.com/watch?v=FJVFXsNzYZQ https://www.youtube.com/watch?v=QYVucud3ptc https://www.youtube.com/watch?v=ZzI9JE0i6Lc&list=PL0vfts4VzfNjdPuyk9SJDIvpsOjNgU1bs&pp=iAQB https://www.youtube.com/watch?v=RlPNh_PBZb4&pp=ygUOb2xpdmlhIHJvZHJpZ28%3D https://www.youtube.com/watch?v=X0DvM9DaZl4&pp=ygUOb2xpdmlhIHJvZHJpZ28%3D https://www.youtube.com/watch?v=Udte0tu7IZw&pp=ygUOb2xpdmlhIHJvZHJpZ28%3D"
    ./DownRand -URL $CombinedURL
}

#Gets user input, formats it and sends it to ./DownRand
else{
    while($UserInput -ne ""){
        $UserInput = Read-Host "Enter Main Video URL, one at a time. type nothing and press enter to finish`n"
        if($UserInput -ne ""){
            $InfoURL = "$($UserInput) $($InfoURL)"  
        }
    
    }
    $InfoURL

    while($UserInput2 -ne ""){
        $UserInput2 = Read-Host "Enter Educational `"Ad`", one at a time. type nothing and press enter to finish`n"
        if($UserInput2 -ne ""){
            $MUSICURL = "$($UserInput2) $($MUSICURL)"
        }     
    }

    $CombinedURL = "$($InfoURL)$($MUSICURL)"

    $CombinedURl = $CombinedURL.Trim()

    $CombinedURL
    ./DownRand -URL $CombinedURL
}
