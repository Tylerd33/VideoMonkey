#DOWNLOADS VIDEOS IN .WAV FORMAT TO FILE DIRECTORY RAND_ORD_DL AND ADDS 4 RANDOM NUMBERS IN FRONT OF EACH FILE AS WELL AS RAND TAG 
#IGNORES ANY FILE WITHOUT .WAV EXTENSION
#INPUT: URL OF VIDEO OR PLAYLIST TO DOWNLOAD



param (
    [string]$URL
    )


#Create directory to store merge if not exist
if(Test-Path -Path Rand_Ord_DL){
    Write-Output "Rand_Ord_DL Path exists... deleting and recreating"
    rm Rand_Ord_DL
    New-Item -Itemtype "directory" Rand_Ord_DL
}
else{
    Write-Output "Rand_Ord_DL Path does not exist, creating..."
    New-Item -Itemtype "directory" Rand_Ord_DL
}
#Go to direct0ry
cd Rand_Ord_DL
#Download Playlist in Current Directory
$URL

foreach($SingleUrl in ($URL -split " ")){
    $SingleURL
    yt-dlp -x --audio-format wav $SingleURL
}
#$URL    
#yt-dlp -x --audio-format wav $URL

#Go through every File in Directory and rename the file to have random numbers in front
$files = Get-ChildItem -File

foreach($file in $files){
    #Skip file if RNDA in file name
    if($file.Name -match "RNDA"){
        Write-Output "RNDA Match found for file with name:'n $($file.Name)'n 'nWill not touch file"
   }

   #Give 4 digit number to beginning of file in order to effectively randomize storage
   #Gets rid of spacing to help later code, also appends RAND to help later identify file
   else{
        Write-Output "Appending Random Number and RAND in front of file as well as deleting spacing 'n$($file.name)"
        $randomNum = Get-Random -Minimum 1000 -Maximum 9999
        $newFileName = "$($randomNum)RNDA$($file.Name)"
        $newFileName = $newFileName -replace " ", "_"
        $newFileName = $newFileName -replace "'", "_"
        $file | Rename-Item -NewName $newFileName
   }
}
cd ..
Write-Output "Files downloaded and randomized sort`n`n"

#Runs Script that Merges Files
.\WavMerge.ps1
