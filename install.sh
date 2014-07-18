#!/bin/sh

current_dir=`pwd`
home_dir=$HOME
trash_dir=$home_dir"/.trash/"
config_files="bashrc gitconfig vimrc"

if [ ! -d $trash_dir ];then
    mkdir $trash_dir
fi

for file in ${config_files};do
    config_file=$home_dir"/."$file
    if [ -f $config_file ];then
        mv $config_file $trash_dir
    fi

    ln -s $current_dir"/"$file $config_file
done

