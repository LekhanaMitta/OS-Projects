#!/bin/bash
#set -x

echo input origin directory path
read FROM_DIR

if [ -z "$FROM_DIR" ];
then
        echo please input origin directory
        exit
fi

echo input destination directory path
read TO_DIR

if [ -z "$TO_DIR" ];
then
        echo please input destination directory
        exit
fi

echo input starting string
read START_STR


find $FROM_DIR/ -name $START_STR\* -exec cp -i -v -t $TO_DIR/ {} +

echo -n number of files copied is: 0

find $FROM_DIR/ -name $START_STR\* | wc -l

cd $TO_DIR


pwd

