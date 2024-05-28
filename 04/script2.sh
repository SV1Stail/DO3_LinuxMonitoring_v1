#!/bin/bash

color1=$1
color2=$2
color3=$3
color4=$4
def_color1=$5
def_color2=$6
def_color3=$7
def_color4=$8
    back1=""
    front1=""
    back2=""
    front2=""
    color1_word=""
    color2_word=""
    color3_word=""
    color4_word=""

    if [[ def_color1 -eq 0 ]]; then 
        back1=$color1
    else
        back1="default"
    fi
    if [[ def_color2 -eq 0 ]]; then 
        front1=$color2
    else
        front1="default"
    fi
    if [[ def_color3 -eq 0 ]]; then 
        back2=$color3
    else
        back2="default"
    fi
    if [[ def_color4 -eq 0 ]]; then 
        front2=$color4
    else
        front2="default"
    fi
    
    case $color1 in 
    1) color1_word="(white)";;
    2) color1_word="(red)";;
    3) color1_word="(green)";;
    4) color1_word="(blue)";;
    5) color1_word="(purple)";;
    6) color1_word="(black)";;
    esac
    case $color2 in 
    1) color2_word="(white)";;
    2) color2_word="(red)";;
    3) color2_word="(green)";;
    4) color2_word="(blue)";;
    5) color2_word="(purple)";;
    6) color2_word="(black)";;
    esac
    case $color3 in 
    1) color3_word="(white)";;
    2) color3_word="(red)";;
    3) color3_word="(green)";;
    4) color3_word="(blue)";;
    5) color3_word="(purple)";;
    6) color3_word="(black)";;
    esac
    case $color4 in 
    1) color4_word="(white)";;
    2) color4_word="(red)";;
    3) color4_word="(green)";;
    4) color4_word="(blue)";;
    5) color4_word="(purple)";;
    6) color4_word="(black)";;
    esac

    echo -e "Column 1 background = $back1 $color1_word"
    echo -e "Column 1 font color = $front1 $color2_word"
    echo -e "Column 2 background = $back2 $color3_word"
    echo -e "Column 2 font color = $front2 $color4_word"