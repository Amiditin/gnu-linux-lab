#!/bin/bash

dir=`dirname $0`
source_file="$dir/users_list.txt"


#  iter=1

for user_data in $(cat "$source_file") ; do

login=$(   echo "$user_data" | awk -F '.' {'print $1'})
password=$(echo "$user_data" | awk -F '.' {'print $2'})

echo "Create user with login: $login..."

adduser "$login" &>> /dev/null << EOF
$password
$password






Y

EOF

if [ $? -ne 0 ] ; then
echo "ERROR: User already exist."
else
echo "done."
fi
echo ""


#  [ $iter -eq 1 ] && exit 8  #  FIXME: comment this lina later
#  iter=$(($iter+1))

done
