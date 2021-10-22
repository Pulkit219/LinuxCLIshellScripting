#!/bin/bash

# $1 is the filename while $2 is the column number that has the card number to be decrypted and run in the background
source /test/test/somepath/usr.src;/test/test/test /test/test/unknownpath $1 $2 &
echo last pid is $!
wait $!

filename=$1
CardCol=$2

# Get prev column number
PrevCol=$((CardCol-1))

# Get next column number
NextCol=$((CardCol+1))

#Get the new filename 
newfilename="${filename}"_CLEARfileext
newfilename_tmp="${newfilename}"_tmp
echo newfilename_tmp

#Fixing the header
seddcommand=`sed 's/DECRPT_ERROR: CARD N/CARD NUMBER/' $newfilename > $newfilename_tmp`

#Re-arranging the columns in proper format
letspastecommand= `paste -d',' <(cut -d',' -f1-$PrevCol $newfilename_tmp) <(cut -d',' -f$CardCol $newfilename_tmp|awk '{print substr($0,1,length-5)}') <(cut -d',' -f$NextCol- $newfilename_tmp) > $newfilename`


vrmcommand=`rm $newfilename_tmp`


exit