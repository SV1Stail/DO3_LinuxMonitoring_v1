#!/bin/bash

HOSTNAME=`hostname`
echo -e "HOSTNAME=$HOSTNAME "

	timezone=`timedatectl | grep Time | sed -e 's/[[:space:]]*Time zone: //'`
	count=0
	longcity=""
	shortcity=""
	utc=""
	for letter in $timezone
	do
	if [[ count -eq 0 ]]
	then 
	longcity="$letter"
	elif [[ count -eq 1 ]]
	then
	shortcity=${letter:1:3}
	elif [[ count -eq 2 ]]
	then
	utc=${letter:0:5}
	fi
	count=$(( $count + 1 ))
	done

	u0=""
	u1=""
	u2=""
	u3=""
	u4=""
	for (( i = 0; i < ${#utc}; i++ )) 
	do
	if [[ $i -eq 0 ]]
	then
	u0=${utc:$i:1}
	fi
	if [[ $i -eq 1 ]]
	then
	u1=${utc:$i:1}
	fi 
	if [[ $i -eq 2 ]]
	then
	u2=${utc:$i:1}
	fi
	if [[ $i -eq 3 ]]
	then
	u3=${utc:$i:1}
	fi
	if [[ $i -eq 4 ]]
	then
	u4=${utc:$i:1}
	fi
	done
	
	TIMEZONE="$longcity UTC$u0$u1$u2.$u3$u4"
	
#echo -e "TIMEZONE: $longcity UTC$u0$u1$u2.$u3$u4"
echo -e "TIMEZONE=$TIMEZONE"
	
	user=`who`
	user_short=""
	i=0
	while [[ ${user:$i:1} != [[:space:]] ]]
	do
	    user_short+="${user:$i:1}"

	i=$(( $i + 1 ))
	done

echo "USER=$user_short"

	os=`hostnamectl | grep Operating`
	ostype=`hostnamectl | grep Kernel`
	os=${os:18}
	ostype=${ostype:18}
	OS=$os";  "$ostype
echo "OS=$OS"
	DATE=`date +"%d %b %Y %T"`
echo "DATE=$DATE"
	UPTIME=`uptime -p`

echo "UPTIME=$UPTIME"

	uptime_days=`uptime | awk '{print $3}'`
	uptime_hour=`uptime -p | awk '{print $4}'`
	uptime_mins=`uptime -p | awk '{print $6}'`
	uptime_days=$(( ( uptime_days * 24 + uptime_hour ) * 3600 + uptime_mins * 60 ))

echo "UPTIME_SEC=$uptime_days"

	ips=`ip -4 a | grep inet | awk '{print $2}'`

	count=0
	for i in $ips
	do
	if [[ $count -eq 1 ]]
	then
	ips=$i
	break
	elif [[ $count -lt 1 ]]
	then
	ips=$i
	fi
	count+=1
	done
echo "IP=$ips"

	netmask=`ifconfig | grep netmask | awk '{print $4}'`

	count=0
	for i in $netmask
	do
	if [[ $count -eq 1 ]]
	then
	netmask=$i
	break
	elif [[ $count -lt 1 ]]
	then
	netmask=$i
	fi
	count+=1
	done

echo "MASK=$netmask"

	GATEWAY=`ip route | grep default | awk '{print $3}'`
echo "GATEWAY=$GATEWAY"
	RAM_TOTAL=`free  | grep Mem | awk '{printf("%.3f", $2 / 1024 / 1024)}'`
echo -e "RAM_TOTAL=$RAM_TOTAL GB"
	RAM_USED=`free  |  grep Mem | awk '{printf("%.3f", $3 / 1024 / 1024)}'`
echo -e "RAM_USED=$RAM_USED GB"
	RAM_FREE=`free | grep Mem | awk '{printf("%.3f", $4 / 1024 / 1024)}'`
echo -e "RAM_FREE=$RAM_FREE GB"
	SPACE_ROOT=`df | grep '/$' | awk '{printf("%.2f", $2 / 1024)}'`
echo -e "SPACE_ROOT=$SPACE_ROOT MB"
	SPACE_ROOT_USED=`df | grep '/$' | awk '{printf("%.2f", $3 / 1024)}'`
echo -e "SPACE_ROOT_USED=$SPACE_ROOT_USED MB"
	SPACE_ROOT_FREE=`df | grep '/$' | awk '{printf("%.2f", $4 / 1024)}'`
echo -e "SPACE_ROOT_FREE=$SPACE_ROOT_FREE MB"

chmod +x script_file.sh
./script_file.sh "$HOSTNAME" "$TIMEZONE" "$user_short" "$OS" "$DATE" "$UPTIME" "$uptime_days" "$ips" "$netmask" "$GATEWAY" "$RAM_TOTAL" "$RAM_USED" "$RAM_FREE" "$SPACE_ROOT" "$SPACE_ROOT_USED" "$SPACE_ROOT_FREE"



