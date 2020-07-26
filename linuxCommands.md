# Commands


|   |   |
|---|---|
| **_MY CUSTOM IN-LINE AND BASH LOOPING AND DAILY USAGE LOG COMMANDS_** |
|find . -type f -name "*.log.gz" -exec zgrep -il 22222222 {} `\`;\| xargs zgrep -il mip|. Means current directory, {} is place holder what for list of files what find command found, (`\`;) is to execute it. Piping it to further filtring list of files with the help of xargs and zgrep|
|command checkingAcc 323234234 \| grep TEST \| awk '{print $NF}' \| while read i; do psql-xyz -D dbName -c "select paramA, paramB,paramC, paramD from DB.table where paramA='$i'";done|bash looping using while, so first just simply type command and then start action with do...simple as that|
|find . -type f -name "*.log.gz" -exec zgrep -il "Author name" {} `\`;\|for i in $(xargs);do echo ====$i====;zcat $i\|grep -i "Author name"\|tail -n5;done| looping over filtered list of log files and further zcat over each one of them to find out the lines needed
|find . -type f -exec zgrep -il string {} `\`; -exec cp -t /home/user/DestinationFolder {} +|Copying all list of files found by zgrep to case# folder|
|grep -inrl "Bioethik_Debatte" /var/cqp/upload/heideko/import_files \| xargs cp -t bio_files/|Copying all list of files found by zgrep to case# folder|
|find -mtime -1 -type f \| xargs cp -t inner/|
|find -mtime -1 -type f -exec cp '{}' inner/ `\`;|more safer|
|for i in $(df -h\|grep ACS\|awk '{print $NF}'); do du -sh $i/2020* \| grep G \|tr "G" " "\|awk '{ sum+=$1} END {print sum}';done|looping over the folderpath obtained and getting total space consued by $path/2020* with the help of tr and awk|
|zcat some.log.gz\|grep Throughput\|awk '{ sum+=$3}END{print "Average = ", sum/NR}'  Average =  2.78423|We are using awk with a bit of script to filter and sum our output|
|echo stackoverflow\|tr -d '\n' \| wc -c|Just want to count number of letters from command line, it will give 13|
|cat some.log \| grep -i speed \| awk '{print $8}' \| sed -r 's/(`\`^\|<\|`\[`\|`\]`)/ /g' \| awk -F ',' '{sum+=$1}END{print "Average = ", sum/NR}'|Here powerful sed comes into play ,using regex we calculate the avg speed from logs using AWK command.|
| **_CREATING, MOVING, COPYING FILES_** |
| mkdir -p dir1/dir2/dir3  | creating directory inside directory  |
| mv name.text anothername.txt  | renames file to anothername.txt  |
|  rm example.txt  -r  -f |  Remove a file  -r recursively -f force|
|  rm -f  *tar|  Remove multiple files ending with .tar|
| touch example.txt  |   Creates a text file|
| touch {file1, file2, file3}  |   Creates multiple text file with the helpof {}|
| cat example.txt |  Reads the file |
| echo " some  text" \| tee newFile.txt  | tee will display text to console as well as create a new file with text  |
| echo " some more text" \| tee -a newFile.txt  | tee will display text to console as well as -a append to existing file.  |
| **_REDIRECTIONAL INPUT/OUTPUT_** |
| cat file1.txt > /home/user/somedirectory/random_file  | > this is redirectional output, contents of file1 will be output to random file  |
|  echo " some more text" >> /home/user/somedirectory/random_file | appends to random_file file NOT OVERWRITE  |
| cat file1.txt file2.txt > concatenated_file  | Merge data of 2 files together in one concatenated_file   |
|> /dev/null| redirect output to nowhere|
|sort < file.txt | we are throwing file data to sort command |
| **_SPLITTING FILES_** |
|  split -l 2 somefile.txt  new|  split 2 lines in one new .txt file |
| **_COUNTING_** |
| wc -c   someText.txt| counts characters  |
| wc -w  someText.txt| counts words  |
| wc -l someText.txt | counts lines  |
| cat test.txt \| wc -l  | read and \| the result to count number of lines   |
| **_FILE DISPLAY COMMANDS_** |
| cat test.txt \| more  |  for large text files, it helps view the content page by page |
| cat test.txt \| less  |  for large text files, it helps view the content line by line, j or k to scroll up/down |
| cat test.txt \| pg  | for large text files, it helps view the content page by page  |
|head -5   |  displays 1st 5 lines |
|tail -5   |  displays last 5 lines |
|tail -f   |  displays last updated ones |
| **_FILTERS/TEXT PROCESSORS_** |
| cut -c1-2 somefile.txt  | it will cut fist 2 letters of a word in a file  |
|grep -i admin /etc/passwd \| cut -d: -f1,5  | it will extract 1st and 5th field using -d delimiter -f field |
|grep -i admin /etc/passwd \| cut -d: -f1,5\|sort\|tr ":" " " \|column -t | it will extract 1st and 5th, sort it, tr translate/replace, column display in table format  |
| awk '{print $1'} somefile.txt  | prints first column from a file  |
| grep someword test.txt | gets the line having that pattern  |
| sort  |to sort a-z  , -r for reverse sort |
|  uniq | removes all duplicates  |
| **_COMPARE FILES_** |
| diff file1.txt file2.txt |    |
| cmp file1 file2|   |
| sdiff cmp file1 file2|  shows diff side by side  |
| vimdiff cmp file1 file2|  shows diff in vim editor |
| **_FILE PERMISSIONS_** |
| 4read 2write 1execute |    |
| user u, group g, others o, all a |  read r, write w, execute x, + to add, - to remove, = to set exactly you type  |
| chmod u=rw, g=r, o=r| defining all the permissions in one line, NOTE equal means setting exactly what we are typing |
| chmod u=rw, g+x, o-r| continuing from above, for group I want to add execute so we use PLUS |
| chown ownername:groupname|  change ownership |
| **_SED COMMAND_** |
|  sed 's/Kenny/Lenny/g' sometextfile.txt |s for substitute kenny with lenny g- globally   |
|  sed -i 's/Kenny/Lenny/g' sometextfile.txt | -i means insert that original file, make changes to original file s for substitute kenny with lenny g- globally   |
|  sed 's/Kenny//g' sometextfile.txt | it removes that word from file  |
|  sed '/Kenny/d' sometextfile.txt | d- means delete ,it removes all lines containing those words  |
|  sed '/^$/d' sometextfile.txt |^means starts, $ means ends, d- means delete ,it removes all empty |
|  sed '1d' sometextfile.txt | removes 1st line |
|  sed '1,2d' sometextfile.txt | removes 2 lines |
|  sed '1,2d' sometextfile.txt | removes 2 lines |
|  sed 's/\t/ /g' sometextfile.txt | removes tab with space|
|  sed -n 12,18p sometextfile.txt | displays line 12 to 18|
|  sed 12,18d sometextfile.txt | displays all lines except 12 to 18|
|  sed G sometextfile.txt | adds an empty line after each line|
|  sed '8!s/Kenny/K/g' sometextfile.txt | -! means do not do for that line, make changes to original file  |
| **_LIST FILES_** |
| ls  |    list files|
| ls -ltr | list files with -l means long listing with permissions -t sort according to modification time newer first  -r older files listed at top |
|ls -ltr /example/directory/\*sales\*.txt   | searching files with name sales , it's a wildcard search  |
| find /directory/ -iname \*sales\*  | if you're not sure where exactly are these specific files  USE find with wildcard search -i means ignore case sensitivity|
| ls c`[`aeios`]`t |    look for files that start with c, middle could be any one of those, end with t|
| ls c`[`a-d`]`t |    look for files that start with c, middle could be any one of those but range, end with t|
| ls t?? |    list files that start with t and exactly 3 characters in length|
| locate  | a great command to find if DB is updated, faster than find |
| ls -al   | list all hidden files with directories  |
| ls -R  \| grep ./ | It will list all directories, -R is recursively  |
| **_GZIP_** |
| gzip filename.txt  | compress your file, original will be deleted  |
| gzip -d   | to decompress    |
| gzip -l  | gives details on compression   |
| gzip -r  | zip all files in a folder inside a folder   |
| **_TRUNCATE_** |
| truncate -s 10 | date will be lost but it will shrink the size to 10 bytes|
| **_VI EDITOR_** |
| vi test.txt | editor which will create a file if one doesn't exists  |
|h j k l  | move right left up and down  |
| press i  | for insert mode and then start typing   |
| press ESC  | it will go to command mode as if you're on terminal  |
| press dd | it will cut the entire line where cursor is IN COMMAND MODE  |
| press cc | it will delete the entire line and put you in insert mode |
| press yy | it will copy the entire line where cursor is IN COMMAND MODE  |
| press p | paste  the copied yy line where cursor points to  |
| press u| undo  the line just pasted  |
| press shift+p | paste before the line where cursor points to  |
| press [1 or 2 or 3]shift+g <br/> shift+g| to go to top nth line<br/> to got to bottom line  |
| press cw| change word in command mode, place cursor on 1st letter of word will remove entire word, if on 2nd letter will remove 2nd letter only  |
| press shift+r|  in command mode to replace text or line |
| press esc and then type : wq|  it will save and quit |
| :q!     | discard typed changes ,quit without saving  |
|  :q | quit without saving  |
|  :%s/Kenny/Peter/ then hit enter | replace kenny with peter in VI editor /g to do it globally all over |
|  press $ | cursor will move to the very end of the line   |
| mail -a file.txt/gz -s "report"  manager@mail.com < /dev/null   |  mail compressed file by email, -s for subject, -a for attachment, don't want this command to return anything so < /dev/null |
| **_TAR FILES_** | **_GROUP OF FILES INTO ONE BUT NOT COMPRESSION_**
| tar -cvf combined.tar directory1/ file1.txt file2.txt | combines directory and 2 files into one as .tar   -compress -verbose -what file  you'd like|
| tar -cvzf combined.tar.gz  directory1/ file1.txt file2.txt | combines directory and 2 files into one as .tar  as well -z gZIP it at same time that's why tar.gz|
| tar -xvf combined.tar file1.txt file2.txt | Extract files to their original format   |
| tar -cvfz allSalesreports.tar.gz sales*.txt | setting new file name as allSalesreports =is the input of all sales files    |
|tar -tf allSalesreports.tar.gz  | -t listing the contents of tar file   |
| **_SHOW AND KILL PROCESSES_** |
|pgrep gnome -l   |  shows all processes related to gnome with -l details |
|pgrep gnome -v -u username   |  shows all processes related to users EXCEPT the one specified -v is inverse|
|pgrep -u username -l appname  |  shows app running by that specific user |
|ps -aux   |  shows all processes user oriented, where it started, with details |
|ps axo pid,comm,nice |  shows all processes with pid, command,nice level (-20 to +19,0 is default, higher number low priority) |
|ps -ef   |  shows all processes according to hierarchy |
|ps -ef \| grep test   | presents a lists which consists of test   |
|kill -9 or -15 pid  | it will kill/terminate the process, -15 means gracefully end the process, -9 means forcefully   |
|kill -l | lists all kill signals, important for sys admin  |
|kill -SIGSTOP %1 | stop the job for now, job #1  |
|kill -SIGCONT %1 | continue the job for now, job #1  |
|pkill  |kills a process by name   |
|pkill -t pts/1 |kills all processes for that user launched from terminal   |
| **_ADJUSTING PROCESSS PRIORITY_** |
|systemctl stop httpd  | stop the service first and then increase priority  |
|nice -n 0 httpd  | start this program with niceness of level 0  |
|renice -n 10 2879  | changing niceness level without killing the program  |
|renice -n 10 $(pgrep httpd)  | changing niceness level for all similar programs by using subshell $()  |
| **_LISTING HIGH CPU USAGE PROCESSES_** | 
|w  |  number of users logged in  , uptime, load average 0.03 (past 1 min), 0.07 (past 5 min) ,0.06(past 15min) |
|cat /proc/cpuinfo \| grep"model name" \| wc -l  | gives the number of cpu and then divide the load average (for eg). 1.79/2(#no of processors) =0.895 which means 89% of cpu is being utilized |
|top   | list the processes taking HIGH CPU usage  |
|top  and then press P | sort processes with highest CPU  |
|top  and then press M | sort processes with highest Mem  |
|top  and then press k| to kill aprocess listed with PID  |
|top  and then press r | renice a process listed with PID  |
|top press i   | ignores idle proceses  |
|top -u name   | it will filter processes by that name |
|top -n 2   | run it 2 number of times and then exit |
|top -d 2   | live update it every 2 seconds |
|free -m  | free memory in mb |
| **_RUN PROCESSES BACKGROUND/FOREGROUND_** |
|nohup test.sh &   | -nohup means  no hangup , & means run in background, keep running backgroud jobs even if user is logged out   |
|nohup test.sh & > /dev/null 2>&1 &  | no log messages being generated  |
|jobs -l   | it will  list all background running jobs   |
| CTRL +Z  |sleep 100, sleeping 100 secs and then ctrl +z to stop and then press bg it in bg   |
| bg fg  |background foreground   |
|  nice -19 to 20 | higher to lower priority |
| **_LOG MONITORING  <br/>  cd /var/log_**  | Located all types of log files
|head logfile.txt -n 5   |  displays first 5 lines or by default is 10 without n |
|tail logfile.txt -n 5   |  displays last 5 lines or by default is 10 without n |
|tail logfile.txt -f   |  f stands for follow i.e live log streaming |
|man systemd-journald | system daemon and journal daemon which represents all logs updated recently  |
|man systemd-journald | system daemon and journal daemon which represents all logs updated recently since all logs goes through journald  |
| rsyslog.conf  | file in cd /etc , under #rules gives info what log is located in which log file   |
|journalctl -xn| recent logs  with x for explanation|
|journalctl -f| keeps listening to messages  |
|journalctl -p info| type of log file you want to see, .info  |
|systemctl -t| list of different unit configuration files  |
|journalctl _SYSTEM_UNIT=httpd.service| show system unit file with the help of journalctl  |
|journalctl --since=yesterday| if the system has been running since yesterday because files are temporary unless we changed the option  |
| boot  | shows the log with [ok] messages and red where problem occurs |
| chronyd or NTP  |   |
| cron  |   |
| maillog  | troubleshoting with mail services  |
| secure | troubleshotting with users loggin in /out  |
| messages| all hardware, software, process info   |
| script logfile.log|   records your terminal commands, press exit to exit|
| **_FTP -copy config file to remote server over FTP_** |
|ftp ftpLink   |it will login to FTP server if you've correct password and username   |
| put or get   | transfer files to or get from server  |
|scp ~/someFile.txt user@remote_host.com:tmp/remote/directory   | scp means secure copy from local machine to remove server dest path (uploading) |
|scp user@remote_host.com:tmp/remote/directory ~/downloadfile.txt   | download from remote server to local machine  |
|sftp user@54.165.122.155<br/> sftp>ls<br/>   sftp get file1<br/>   sftp>put file2| download from remote server to local machine  |
| **_GET ALL SERVICES AND STATUS_** |
|systemctl start/stop/enable servicename | it will start/stop/enable  |
|systemctl is-enabled servicename | it will check if it's enabled  |
|service --status-all | it will list all services   |
|service servicename status   | status of a service  |
|sudo service servicename start/stop/restart   | it will start, stop or restart our service  |
| systemctl restart ntpd | start an app after bootup d means daemon which means process runs in background  |
|systemctl status rsyslog  |  shows status of a process|
| **_CONFIGURE LOCAL STORAGE_**  |
| cd /dev  | we see attached device storage here  |
|  **MBR partition** |  partition is a traditional and an old one, can only have 4 partitions of 2TB's |
| fdisk| it manages MBR partitions|
| mkfs -t xfs partitionName(for eg. xvdf1)| it formats the partition with file format (file systems-vfat, ext4, and xfs) |
| blkid | get the partition UUID  you want to mount and use|
|cd /mnt <br/> mkdir mymount <br/> mount /dev/xvdf1 /mnt/mymount  <br/> OR mount -U uuid /mnt/mymount| Mounting file system otherwise you won't be able to use it|
|umount /mnt/mymount | it will unmount the partition|
| df -h |shows total disk size with partitions, if ever we see disk use is close to 90% means we're running out of space   |
| partprobe| whenever we delete/ add a partition, it reloads partition info just in case if kernel is not able to do it, kind of refresh button |
| du -skh * \| sort -nr \| head -5 | lists only top 5 files  |
| **GPT partition**|  modern partitioning scheme which can have many partitions upto 128|
| gdisk /dev/xvdf | we will create or manage partitions|
| mkfs -t xfs partitionName(for eg. xvdf1)| it formats the partition with file format (file systems-vfat, ext4, and xfs) |
| **_USER ACCOUNT MANAGEMENT_**  |
| sudo -  | become root user  |
| sudo passwd user  |  set password for user |
| sudo passwd root  |  set password for root first |
| /etc/passwd  | it stores all uder related info |
| useradd username  | will create a new user and also a group with same name |
| useradd -c "full name" -m -g defaultgroupname -G additionalGroupName,Anothergroup -s /bin/bash usrname  | creating user with parameters -m home directory -s shell |
| passwd username  | creating password for that user|
|  usermod -G newGroup username| it will add that user to newgroup along with primary group remains the same.   |
| userdel username  | deletes an user|
|**Creating System/application account**||
| useradd -c "Apache web server" -d /opt/apache -rOR-u(to assign sameUid over diff systems) -s /user/sbin/nologin usrname  | creating app acct with parameters -r to specify it's system acct -d specifically defining directory -s disabling shell because it's not an user |
| groupadd  groupname| will create a new group|
| tail /etc/group| in etc -group are where group info are located |
|  groups  username| shows all the groups , user is a part of  |
| groupdel  groupname| will delete a group|
| groupmod  groupname| will modify a group|
| chgrp -R groupName username| chnage primary group of an  user , -r means recursively apply  |
| useradd -g someGroup -s /bin/bash/ -c "desc" -m -d /home/username username | it will add user to a group with desc   |
| su -username  | switch user   |
| **_MONITOR USERS_**  |
|who   |how many people are logged in    |
|last  |  all users logged in when  |
|w  |  number of users logged in  , uptime, load average 0.03 (past 1 min), 0.07 (past 5 min) ,0.06(past 15min) |
|finger  | traces an user idle time, since when loggen in   |
|uptime  |  gives machine uptime |
| **_TALK TO USERS TO BROADCAST IMPORTANT INFO_**  |
|wall   |  your message and then ctrl +D  |
|write user   |  to specific user |
| **_LINUX ACCOUNT AUTHENTICATION_**  |
|IDM BY redhat |   |
|OpenLDAP open source   |   |
|IBM Directory serve   |   |
| LDAP  |lightweight directory access protocol   |
| **_LINUX UTILITY COMMANDS_**  |
| date  | gives date and time  |
| which  date| tells where the command is located, commands are basically scripts written by developers  |
|  cal | gives calender  |
| bc  | binary calc  |
| **_TASK SCHEDULING WITH CRONTAB_**  |
| crontab -e  | Minute hour */specificDayOfMonth */specificMonth weekday1-5mondayToFriday |
|cd to etc   |diff types of folder ,  weekely, hourly , monthly and just simply put your script  |
| **_CHECK ENVIRONMENT VARIABLES OR SERVER ENV VARS_** |
|export | shows all environment varaiables of a machine |  
|export \| grep path   |  it will print PATH variable setting |
|echo $PATH   | it will print path settings  |
|export JAVA_HOME=/usr/bin/jdk  |   |
| **_VIEW KERNEL MESSAGES_** | VERY HELPFUL IN DIAGNOSING IN CASE OF DEVICE FAILURE , KERNEL WILL BE AWARE OF IT IN CASES OF MALFUNCTION
|dmesg \| grep sda | to check if hard disk was directed  |
|dmesg \| grep -i usb  | info on USB's  |
|dmesg \| grep -i dma   | info on direct memory access  |
|dmesg \| grep -i tty   |info on serial ports   |
|dmesg \| grep -i memory   |info on how much memory we have   |
|dmesg -c   |dmesg buffer is cleared   |
| tail -f /var/log/dmesg  |shows latest info from the bottom as it says tail in command   |
| **_VIRTUAL MEMORY STATISTICS_** | HELPS IDENTIFY PERFORMANCE BOTTLENECKS, ABOUT PROCESSES, PAGING, BLOCK IO, TRAPS, CPU ACTIVITY
|vmstat   | shows memory stats   |
|vmstat -a  | shows active inactive memory   |
|vmstat 1 5  | values will be measured every 1 second for upto 5 times   |
| **_SLOW SLUGGISH SERVER_** | MAIN CAUSES ARE CPU, IO, RAM. NETWORK
|  top |   |
| **_SAR - SYSTEM ACTIVITY REPORTING_** 
| sar  | view CPU stats  |
| sar -r |view RAM stats   |
| sar -b  |view disk stats   |
| sar -F  | view mounted file system stats  |
| sar -n dev  |view network stats   |
| sar -A  |all stats at once   |
| sar -s 20:00:00 -e 20:30:00  |view CPU data from 8pm to 8.30pm   |
|/var/log/sa|to access previous sar logs|
| sar -f /var/log/sysstat/sa06  | view stats on 6th day of month  |
| **_IOSTAT_** 
|IT IS A PART OF sysstat PACKAGE  WHICH INCLUDES, sar,iostat,mpstat,pidstat,sadf
|iostat option -c   | CPU usage statistics  |
|iostat option -d   |only the disk I/O statistics   |
|iostat option -n   |displays only the device and NFS statistics   |
|iostat -xz  -l | monitoring input/output device loads  |
|when machine's RAM is being fully utilzed then swap comes into action which results in performance bottlenecks or if you have lot of RAM then you need to figure out which program is suffering   |   |
| Try to figure out which device is having highest IO load  |   |
|iotop  |  just like top gives you info which process is having heavy IO |
| **_LIST OF OPEN FILES_**  |
|lsof \| wc -l  | lines shows how many open files  |
|lsof -u root   | filter open files by the user   |
| lsof -i tcp:22  | filter using port numbers  |
|kill -9 'Lsof -t -u username| kill processes of specific user   |
| **_CPU INFO AND MEM INFO_**  |
| cat /proc/cpuinfo  |  shows cpuinfo |
| cat /proc/meminfo  |  shows meminfo |
|uname -a |   |
|dmidecode | sys info  base info etc...  |
|arch | x86 or 64 bit architechure  |
| **_SHUTDOWN HALT REBOOT_**  | **_systemd is controlling system levels shutdown, reboot instead of init_**
| shutdown -r +5 System going down for reboot | r for reboot, 5 minutes, a wall message which notify other logged in users |
| shutdown -r now | reboot now |
| shutdown -r 00:00 | reboot at 12 am |
| shutdown -h | halt |
| shutdown -P | Power off machine |
| reboot  | reboot your machine  |
| **_CHANGE HOSTNAME_**  |
|hostnamectl set-hostname newName   |   changes hostname  |
| **_RECOVER ROOT PASSWORD_**  |
| please refer to video  |   |
| **_SYSTEM RUN LEVELS_**  |
|  who -r | checks for run level  |
|  0 |  shut down the system init 0 |
|   1|  single user mode 1 |
|   init 6| reboot the system  |
| init 2  | multiuser mode without networking  |
|  init 3 | multiuser mode with networking   |
|  init 5 | multiuser mode with networking and gui  |
|   |   |
|   |   |
|   |   |
|   |   |
|   |   |
|   |   |
|   |   |
|   |   |
