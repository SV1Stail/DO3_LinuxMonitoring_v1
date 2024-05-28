#!/bin/bash
    color1=$1
    color2=$2
    color3=$3
    color4=$4
    
	text_w="\033[97m"
	text_r="\033[91m"
	text_g="\033[92m"
	text_blue="\033[36m"
	text_p="\033[95m"
	text_black="\033[30m"

	back_w="\033[107m"
	back_r="\033[101m"
	back_g="\033[101m"
	back_blue="\033[46m"
	back_p="\033[105m"
	back_black="\033[40m"

	tail_tail="\033[0m"


	case $color1 in 
		1) back_color_znach=$back_w ;;
		2) back_color_znach=$back_r ;;
		3) back_color_znach=$back_g ;;
		4) back_color_znach=$back_blue ;;
		5) back_color_znach=$back_p ;;
		6) back_color_znach=$back_black ;;
	esac
	case $color2 in 
		1) text_color_znach=$text_w ;;
		2) text_color_znach=$text_r ;;
		3) text_color_znach=$text_g ;;
		4) text_color_znach=$text_blue ;;
		5) text_color_znach=$text_p ;;
		6) text_color_znach=$text_black ;;
	esac
	case $color3 in 
		1) back_color_after=$back_w ;;
		2) back_color_after=$back_r ;;
		3) back_color_after=$back_g ;;
		4) back_color_after=$back_blue ;;
		5) back_color_after=$back_p ;;
		6) back_color_after=$back_black ;;
	esac
	case $color4 in 
		1) text_color_after=$text_w ;;
		2) text_color_after=$text_r ;;
		3) text_color_after=$text_g ;;
		4) text_color_after=$text_blue ;;
		5) text_color_after=$text_p ;;
		6) text_color_after=$text_black ;;
	esac

		HOSTNAME=`hostname`
	echo -e "$text_color_znach$back_color_znach""HOSTNAME""$tail_tail""=""$back_color_after$text_color_after""$HOSTNAME""$tail_tail"




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
		
		TIMEZONE=$longcity" UTC"$u0$u1$u2"."$u3$u4
		
	#echo -e "TIMEZONE: $longcity UTC$u0$u1$u2.$u3$u4"
	# echo -e "TIMEZONE=$TIMEZONE"
	echo -e "$text_color_znach$back_color_znach""TIMEZONE""$tail_tail""=""$back_color_after$text_color_after""$TIMEZONE""$tail_tail"
		user=`who`
		user_short=""
		i=0
		while [[ ${user:$i:1} != [[:space:]] ]]
		do
		    user_short+="${user:$i:1}"

		i=$(( $i + 1 ))
		done

	# echo "USER=$user_short"
	echo -e "$text_color_znach$back_color_znach""USER""$tail_tail""=""$back_color_after$text_color_after""$user_short""$tail_tail"

		os=`hostnamectl | grep Operating`
		ostype=`hostnamectl | grep Kernel`
		os=${os:18}
		ostype=${ostype:18}
		OS=$os";  "$ostype
	# echo "OS=$OS"
	echo -e "$text_color_znach$back_color_znach""OS""$tail_tail""=""$back_color_after$text_color_after""$OS""$tail_tail"

		DATE=`date +"%d %b %Y %T"`
	# echo "DATE=$DATE"
	echo -e "$text_color_znach$back_color_znach""DATE""$tail_tail""=""$back_color_after$text_color_after""$DATE""$tail_tail"

		UPTIME=`uptime -p`
	# echo "UPTIME=$UPTIME"
	echo -e "$text_color_znach$back_color_znach""UPTIME""$tail_tail""=""$back_color_after$text_color_after""$UPTIME""$tail_tail"

		uptime_days=`uptime | awk '{print $3}'`
		uptime_hour=`uptime -p | awk '{print $4}'`
		uptime_mins=`uptime -p | awk '{print $6}'`
		uptime_days=$(( ( uptime_days * 24 + uptime_hour ) * 3600 + uptime_mins * 60 ))

	# echo "UPTIME_SEC=$uptime_days"
	echo -e "$text_color_znach$back_color_znach""UPTIME_SEC""$tail_tail""=""$back_color_after$text_color_after""$uptime_days""$tail_tail"

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
	# echo "IP=$ips"
	echo -e "$text_color_znach$back_color_znach""IP""$tail_tail""=""$back_color_after$text_color_after""$ips""$tail_tail"

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
	# echo "MASK=$netmask"
	echo -e "$text_color_znach$back_color_znach""MASK""$tail_tail""=""$back_color_after$text_color_after""$netmask""$tail_tail"

		GATEWAY=`ip route | grep default | awk '{print $3}'`
	# echo "GATEWAY=$GATEWAY"
	echo -e "$text_color_znach$back_color_znach""GATEWAY""$tail_tail""=""$back_color_after$text_color_after""$GATEWAY""$tail_tail"

		RAM_TOTAL=`free  | grep Mem | awk '{printf("%.3f", $2 / 1024 / 1024)}'`
	# echo -e "RAM_TOTAL=$RAM_TOTAL GB"
	echo -e "$text_color_znach$back_color_znach""RAM_TOTAL""$tail_tail""=""$back_color_after$text_color_after""$RAM_TOTAL GB""$tail_tail"

		RAM_USED=`free  |  grep Mem | awk '{printf("%.3f", $3 / 1024 / 1024)}'`
	# echo -e "RAM_USED=$RAM_USED GB"
	echo -e "$text_color_znach$back_color_znach""RAM_USED""$tail_tail""=""$back_color_after$text_color_after""$RAM_USED GB""$tail_tail"

		RAM_FREE=`free | grep Mem | awk '{printf("%.3f", $4 / 1024 / 1024)}'`
	# echo -e "RAM_FREE=$RAM_FREE GB"
	echo -e "$text_color_znach$back_color_znach""RAM_FREE""$tail_tail""=""$back_color_after$text_color_after""$RAM_FREE GB""$tail_tail"

		SPACE_ROOT=`df | grep '/$' | awk '{printf("%.2f", $2 / 1024)}'`
	# echo -e "SPACE_ROOT=$SPACE_ROOT MB"
	echo -e "$text_color_znach$back_color_znach""SPACE_ROOT""$tail_tail""=""$back_color_after$text_color_after""$SPACE_ROOT MB""$tail_tail"

		SPACE_ROOT_USED=`df | grep '/$' | awk '{printf("%.2f", $3 / 1024)}'`
	# echo -e "SPACE_ROOT_USED=$SPACE_ROOT_USED MB"
	echo -e "$text_color_znach$back_color_znach""SPACE_ROOT_USED""$tail_tail""=""$back_color_after$text_color_after""$SPACE_ROOT_USED MB""$tail_tail"

		SPACE_ROOT_FREE=`df | grep '/$' | awk '{printf("%.2f", $4 / 1024)}'`
	# echo -e "SPACE_ROOT_FREE=$SPACE_ROOT_FREE MB"
	echo -e "$text_color_znach$back_color_znach""SPACE_ROOT_FREE""$tail_tail""=""$back_color_after$text_color_after""$SPACE_ROOT_FREE MB""$tail_tail"


