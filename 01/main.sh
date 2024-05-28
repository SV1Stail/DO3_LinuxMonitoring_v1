#!/bin/bash

if [[ $1 =~ ^[0-9]+$ ]]
then
echo -e "ERROR\n	\$1 = digit"
elif [[ $# > 1 || $# < 1 ]]
then
echo -e "ERROR\n	to much arguments or no arguments or empty arguments"
else
echo "$1"
fi

