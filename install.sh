#!/bin/sh

current_dir=`pwd`
home_dir=$HOME
dotfiles_dir=$home_dir"/.dotfiles"
trash_dir=$home_dir"/.trash/"
config_files="bashrc gitconfig vimrc npmrc pip"

if [ ! -d $trash_dir ];then
    mkdir $trash_dir
fi

for file in ${config_files};do
    config_file=$home_dir"/."$file
    if [ -f $config_file ] || [ -d $config_file ];then
        mv $config_file $trash_dir
    fi

    ln -s $dotfiles_dir"/"$file $config_file
done
