$folder="C:\Users\admin\Desktop\FAH_PST\batch2\gsuiteno\New Folder";             # Directory to place the new folders in.
$txtFile="C:\Users\admin\Desktop\FAH_PST\batch2\gsuiteno\testexport.txt"; # File with list of new folder-names

get-content $txtFile | %{

        mkdir "$folder\$_";

}
