#!/bin/bash

currentVersion="0.0.1"

httpSingleUpload()
{
    response=$(curl -A curl --upload-file "$1" "https://transfer.sh/$2") || { echo "Failure!"; return 1;}
}

printUploadResponse()
{
fileID=$(echo "$response" | cut -d "/" -f 4)
  cat <<EOF
Transfer File URL: $response
EOF
}

singleUpload()
{
  filePath=$(echo "$1" | sed s:"~":"$HOME":g)
  if ! -f "$filePath" ;then { echo "Error: invalid file path"; return 1;}; fi
  tempFileName=$(echo "$1" | sed "s/.*\///")
  echo "Uploading $tempFileName"
  httpSingleUpload "$filePath $tempFileName"
}

singleUpload "$1" || exit 1
printUploadResponse

for file in "$@"; do 
  if   test -f "$file"; then
     curl --upload-file "$file" "https://transfer.sh/$file" 
 echo " "

  fi
done


singleDowload () {

 if [ "$1" = "-d" ]; then
   curl -O "https://transfer.sh/$2"
 fi
 
return "printDownloadResponse"

}




 if [ "$1" = "-h" ]; then
echo "Description: Bash tool to transfer files from the command line."
echo "Usage:"
echo "-d  download"
echo "-h  Show the help ..." 
echo "-v  Get the tool version"
echo "Examples:"
echo "./transfer.sh test.txt "
echo "./transfer.sh test.txt test2.txt"
echo "./transfer.sh -d test2.txt"
  elif [ "$1" = "-v" ]; then
echo "0.0.1"

 fi
