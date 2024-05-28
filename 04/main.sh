#!/bin/bash
flag=1
count=0
file_name="conf_colors.txt"
awk '{FS="="}{print $2}'  $file_name > newxyzbrainyki.txt
echo $x
color1=-1
    color2=-1
    color3=-1
    color4=-1

while IFS= read -r line
do
  case $count in
  1) color1=$line ;;
  2) color2=$line ;;
  3) color3=$line ;;
  4) color4=$line ;;
  esac
  count=$(( count + 1 ))
done < newxyzbrainyki.txt
rm -rf newxyzbrainyki.txt
# флаги значащие что необходимо дефолтный цвет
def_color1=0
def_color2=0
def_color3=0
def_color4=0


# деф цвета не повторяются
if [[ -z "$color1" && ! -z "$color2" ]]; then
    if [[ $color2 -gt 1 ]]; then
        color1=$(( $color2 - 1 ))
        def_color1=1    
    else
        color1=$(( $color2 + 3 ))
        def_color1=1
    fi
elif [[ -z "$color1" && -z "$color2" ]]; then
    color1=1
    def_color1=1
fi
if [[ -z "$color2" ]]
then
    if [[ $color1 -gt 1 ]]
    then
        color2=$(( $color1 - 1 ))
        def_color2=1
    else
        color2=$(( $color1 + 3 ))
        def_color2=1
    fi
fi
if [[ -z "$color3" && ! -z "$color4" ]]
then
    if [[ $color4 -gt 1 ]]
    then
        color3=$(( $color4 - 1 ))
        def_color3=1
    else
        color3=$(( $color4 + 3 ))
        def_color3=1
    fi
elif [[ -z "$color3" && -z "$color4" ]]; then
    color3=1
    def_color3=1
fi
if [[ -z "$color4"  ]]
then
    if [[ $color3 -gt 1 ]]
    then
        color4=$(( $color3 - 1 ))
        def_color4=1
    else
        color4=$(( $color3 + 3 ))
        def_color4=1
    fi
fi






    if [[ $color1 -eq $color2 || $color3 -eq $color4 ]] 
    then
    	echo -e "some params are equal, change params in $file_name and restart"
    	echo -e "Did you change $file_name and ready for restart?? (Y/N)"
    	read answer
    	flag=1
    	if [[ $answer = "Y" || $answer = "y" ]] 
    	then
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
    echo ""
    chmod +x script2.sh
    ./script2.sh $color1 $color2 $color3 $color4 $def_color1 $def_color2 $def_color3 $def_color4
    fi