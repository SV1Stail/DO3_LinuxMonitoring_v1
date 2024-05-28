#!/bin/bash
echo "1"
script="main.sh"
arg=1413
echo "arg = $arg"
bash $script $arg
echo "------------------"

echo "2"
arg=131gg
echo "arg = $arg"
bash $script $arg
echo "------------------"

echo "3"
arg=" "
echo "arg = $arg"
bash $script $arg
echo "------------------"
echo "4"
arg="krkgk"
arg2="tsdf"
echo "arg = $arg arg2 = $arg2"
bash $script $arg $arg2
echo "------------------"
