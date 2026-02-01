#!/bin/bash

echo -n enter origin pathname/filename: 
while :
do
	read ORIGIN										#read origin pathname/filename
	if [ -f "$ORIGIN" ]; then						#check if the file exists
		break										#if file exists, then leave the loop
	else
		echo invalid file or path. try again.		#if it doesn't exist, another iteration
	fi												#of the while loop ensues
done

echo -n enter destination directory path: 	
while :
do
        read DEST									#read destination directory path
        if [ -d "$DEST" ]; then						#check if directory exists
                break								#if it does, leave the loop	
        else    	
                echo invalid directory. try again.	#if it doesn't exist, another iteration
	fi
done

declare -i delimPut=0        						#a variable to check if user has input
													#value of delimiter or not

read -p "Would you like to input a delimiter? (y/n): " ans
if [ "$ans" == 'y' ]								#if user answers yes to input delimiter
then
	IFS= read -r -p "Enter value of delimiter: " DELIMITER		#using IFS to retain whitespace
	delimPut=$((delimPut+1))						#setting delimPut value to 1
fi

echo enter range of fields
read FIELDS											#read fields
if [[ -z "$FIELDS" ]]; then							#checks if user has input anything for field
   echo cut: fields are numbered from 1				#error statement if empty input
   exit 1
fi

touch $DEST/output_$(basename $ORIGIN)				#create new file in destination directory
													#with name as output_filename

gcc mycut.c -o mycut						#compiling C program
	
if [[ "$delimPut" -gt 0 ]]							#checks if user has input delimiter or not
then												#if user has given input, pass it to command line
	./mycut -d "$DELIMITER" -f "$FIELDS" $ORIGIN > $DEST/output_$(basename $ORIGIN)	
else												#if no input, do not pass
	./mycut -f "$FIELDS" $ORIGIN > $DEST/output_$(basename $ORIGIN)
fi

exit 1
