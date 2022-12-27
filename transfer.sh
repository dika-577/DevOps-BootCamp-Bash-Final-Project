#!/bin/bash

currentVersion="1.23.0"

multiUpload ()
{

for file in "$@";
do 
  if   test -f "$file"; then
    file_url=$(curl --upload-file "$file" "https://transfer.sh/$file") 
    curl --upload-file "$file" "https://transfer.sh/$file" &> /dev/null
    filePath=$(echo "$file_url")  
    fileID="$file"

    echo "Uploading $fileID"
    echo "Transfer File URL: $filePath"

  fi
done
}

singleDownload() {

 if [ "$1" = "-d" ]; then
   curl "$2"  &> /dev/null
 fi
 
}

printDownloadResponse()
{
 if [ "$1" = "-d" ]; then
  filepath="$2"
  file_name=$(echo "$filepath" | cut -d "/" -f 5)
  echo "Downloading $file_name"  
 fi

}


help_bar()
{
 if [ "$1" = "-h" ]; then
echo "Usage:"
echo "-d  download"
echo "-h  Show the help ..." 
echo "-v  Get the tool version"
echo "Examples:"
echo "./transfer.sh test.txt "
echo "./transfer.sh test.txt test2.txt"
echo "./transfer.sh -d test2.txt"
  elif [ "$1" = "-v" ]; then
echo "$currentVersion"

 fi
}
