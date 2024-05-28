#!/bin/bash
params=("$@")
echo -e "Do you want to write all in file? (Y/N)"
read answer
if [[ $answer = "Y" || $answer = "y" ]] 
then
    name=$(date +"%d_%m_%Y_%H_%M_%S.status")
    if [[ ! -f $name ]]
    then
        `touch $name`
        echo -e "HOSTNAME=${params[0]}" >> $name
        echo -e "TIMEZONE=${params[1]}">> $name
        echo "USER=${params[2]}">> $name
        echo "OS=${params[3]}">> $name
        echo "DATE=${params[4]}">> $name
        echo "UPTIME=${params[5]}">> $name
        echo "UPTIME_SEC=${params[6]}">> $name
        echo "IP=${params[7]}" >> $name
        echo "MASK=${params[8]}">> $name
        echo "GATEWAY=${params[9]}">> $name
        echo -e "RAM_TOTAL=${params[10]} GB">> $name
        echo -e "RAM_USED=${params[11]} GB">> $name
        echo -e "RAM_FREE=${params[12]} GB">> $name
        echo -e "SPACE_ROOT=${params[13]} MB">> $name
        echo -e "SPACE_ROOT_USED=${params[14]} MB">> $name
        echo -e "SPACE_ROOT_FREE=${params[15]} MB">> $name
    fi
fi

