#!/bin/bash

LOCATION=/home/$(whoami)/command
FILENAME=$LOCATION/$1.txt
func_cmdlist()	{
	echo
	echo "[command list]"
	ls $LOCATION | awk {'print $NF'} | awk -F. '{print $1}' | grep -v "cmd" | grep -v "command" 
}


func_print_section()	{
	local file_name=$1
	local section_name=$2
	
	#echo file_name : $file_name
	echo $section_name
	awk -F"[<>]" '/'"${section_name}"'/ {getline;print $1;exit}' $file_name
}

# head
echo ""

# git basic info print
echo "repo : git clone git@bitbucket.org:godofembedded/command.git"

# check command 
if [ $# -eq 0 ];
then
	echo "usege : cmd command_name"
	func_cmdlist
	exit
fi

# check file
if [ ! -f $FILENAME ];
then
	echo $1 is not exist
	func_cmdlist
	exit
fi

# check if section is exist
ret=`cat $FILENAME | grep "section :" | awk -F: {'print $NF'}`
if [ $ret == "Y" ];
then
	if [ $# -eq 2 ];
	then 
		func_print_section $FILENAME $2	
	fi
else
	if [ $2 == "add" ];
	then
# modify the detail contents from command
		vim ${FILENAME}
	else
# print contents of command
		cat $FILENAME
	fi
fi

