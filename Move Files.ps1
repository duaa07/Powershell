#move files according to the source destination in csv file
Import-Csv -Path C:\Users\admin\filelist.csv -ErrorAction Stop | foreach {
    
   Move-Item -Path $_.Source -Destination $_.Destination

}
