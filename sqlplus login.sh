#!/bin/bash

######################
#Description: This script will take a parameter as .sql file 
#which will have DML statement and exceute it with given user/password
######################
echo executing CMR script
PASS="Pasword"
USER="bansalp"

sqlplus -s $USER/$PASS >$1.txt 2>&1 << EOF

whenever sqlerror exit sql.sqlcode;
set pages 0
set heading off
set time off
set timing off
set feed off

spool $1.txt
start $1.sql
commit;
exit

EOF
