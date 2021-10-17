
######################################################
# This script is simply sshing into the list servers #
# to see what servres user can access                #
######################################################

#!/bin/bash
USER="pulkitbansal"
PRIVATE_KEY="/home/pulkitbansal/.ssh/id_rsa"

while read HOST; do
    ssh -ni $PRIVATE_KEY $USER@$HOST "uname -a" < /dev/null;
    echo "$HOST $?" >> server_status.log
done < hostlist.txt

#sources 
#https://unix.stackexchange.com/questions/107800/using-while-loop-to-ssh-to-multiple-servers
#https://stackoverflow.com/questions/50267921/why-do-we-do-dev-null-in-certain-shell-commands