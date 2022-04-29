#!/bin/bash

dir=`dirname $0`
date=$(date +"%Y-%m-%d_%H-%M-%S")
source_file="$dir/users_list.txt"

#iter=1

for user_data in $(cat "$source_file") ; do

login=$(   echo "$user_data" | awk -F '.' {'print $1'})
password=$(echo "$user_data" | awk -F '.' {'print $2'})

echo "Delete user with login: $login..."

if [ "$1" == "backup" -o "$1" == "b" ]; then
echo "Backup attempt"
tar -rf "/opt/lr01-batch-user-reg/backup-users/$date.tar" "/home/$login"
fi

deluser --remove-home "$login" &>> /dev/null

if [ $? -ne 0 ] ; then
echo "ERROR. User $login does not exist"
else
echo "done."
fi
echo ""

#if [ $iter -eq 10 ]; then
#if [ "$1" == "backup" -o "$1" == "b" ]; then
#if [ "$2" == "extract" -o "$2" == "e" -o "$2" == "x" ]; then
#echo "Extract create archive"
#mkdir  "/opt/lr01-batch-user-reg/backup-users/$date" -
#tar -xf "/opt/lr01-batch-user-reg/backup-users/$date.tar" -C "/opt/lr01-batch-user-reg/backup-users/$date"
#fi
#fi
#exit 8
#fi
#iter=$(($iter+1))

done


if [ "$1" == "backup" -o "$1" == "b" ]; then
if [ "$2" == "extract" -o "$2" == "e" -o "$2" == "x" ]; then
echo "Extract create archive"
mkdir  "/opt/lr01-batch-user-reg/backup-users/$date" -
tar -xf "/opt/lr01-batch-user-reg/backup-users/$date.tar" -C "/opt/lr01-batch-user-reg/backup-users/$date"
fi
fi
