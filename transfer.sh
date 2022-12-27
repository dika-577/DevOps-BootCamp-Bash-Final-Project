#!/bin/bash

currentVersion="1.23.0"

multiUpload()
{
#echo $@
for file in "$@";
do
#echo $file

#file=$1
  if   test -f "$file"; then
   #echo $(basename $file)
    file_url=$(curl  -s --progress-bar  --upload-file "$file" "https://transfer.sh/$file") 
    #curl -s  --upload-file "$file" "https://transfer.sh/$file" 
    #filePath=$(echo "$file_url")  
    fileID="$file"

    echo "Uploading $fileID"
    echo "####################################################### 100.0%"
    echo "Transfer File URL: $file_url"
#    else 
  #   echo "Not file"
  fi
done
}

singleDownload() {

# if [ "$1" = "-d" ]; then
   curl -s "$2"  
# fi
 
}

printDownloadResponse()
{
# if [ "$1" = "-d" ]; then
  filepath="$2"
  file_name=$(echo "$filepath" | cut -d "/" -f 5)
  echo "Downloading $file_name"  
# fi

}





help_bar()
{
# if [ "$1" = "-h" ]; then
echo "Usage:"
echo "-d  download"
echo "-h  Show the help ..." 
echo "-v  Get the tool version"
echo "Examples:"
echo "./transfer.sh test.txt "
echo "./transfer.sh test.txt test2.txt"
echo "./transfer.sh -d test2.txt"
#  elif [ "$1" = "-v" ]; then
#echo "$currentVersion"

 #fi
}

 case $1 in

  "-v")
     echo "$currentVersion"    
  exit;;
  "-h")
  help_bar
 exit;;
  "-d")
 singleDownload "$2"
 printDownloadResponse "$2" 
 exit;;
#    *)
# multiUpload $@
# echo $1
# exit;; 
 esac

