#V1.0
#Will likely update soon to make using script more intuitive
param (
    [string]$URL
    )
#Create directory to store downloads
mkdir Rand_Ord_DL
#Entire Program executes in Rand_Ord_DL
cd Rand_Ord_DL
#Download Playlist in Current Directory    
yt-dlp -x --audio-format mp3 $URL
#Go through every File in Directory and rename the file to have random numbers in front
$files = Get-ChildItem -File
foreach($file in $files){
    $randomNum = Get-Random -Minimum 1000 -Maximum 9999
    $newFileName = "$randomNum$($file.Name)"
    $file | Rename-Item -NewName $newFileName
    cd ..
}
