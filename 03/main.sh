#!/bin/bash
flag=1
color1=$1
color2=$2
color3=$3
color4=$4
if [[ $# -ne 4 ]] 
then 
	echo -e "wrong number of params try again"
	flag=0
	exit 1
elif [[ $color1 -eq $color2 || $color3 -eq $color4 ]] 
then
	echo -e "some params are equal"
	echo -e "Do you want to restart? (Y/N)"
	read answer
	flag=1
	if [[ $answer = "Y" || $answer = "y" ]] 
	then
		read -p "./main.sh " color1 color2 color3 color4
		exec ./main.sh $color1 $color2 $color3 $color4
	else
		flag=0
		exit 1
	fi
else
	for i in $color1 $color2 $color3 $color4
	do
		if [[ ! $i =~ ^[1-6]$ ]]
		then
			echo -e "value not in acceptable range"
			flag=0
			exit 1
		fi
	done
fi
if [[ $flag -eq 1 ]]
then
chmod +x script.sh
./script.sh $color1 $color2 $color3 $color4
fi
