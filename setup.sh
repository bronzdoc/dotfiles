#!/usr/bin/env bash

#********************************
# Author: luis Sagastume
# Email: lsagastume1990@gmail.com
# install.sh
# Setup for dotfiles
#********************************

#Dotfiles
dotfiles=".vimrc .zshrc .bashrc .tmux.conf"

# Create directory to backup files
if [ ! -d "$PWD/backups" ]; then
    mkdir "$PWD/backups"
fi

#************************************************
# Setup function
# will handle configuration and update of dotfiles
#************************************************
function setup()
{
    file="$1"
    if [ ! -f ~/"$file" ]; then
	# "${string#substring}" remove substring from string
	ln -s "$PWD/${file#.}" ~/"$file"
        echo "Setting up $file"
    else
	echo -n "$file file already exists, do you want to update it [y/n]: "
	read update
        old_file="$file-$(date +%m-%d-%Y)"
	if [ "$update" == "y" ]; then
	    mv ~/"$file" ~/"$old_file"; mv ~/"$old_file" "$PWD/backups"
	    ln -s "$PWD/bashrc" ~/$file
	    echo "$file updated"
	fi
    fi
}

#****************************************
# Help function
# Display available args to setup program
#****************************************
function help()
{
    printf "Setup a specific file passing one of the following arguents:\n"
    printf "1. vimrc\n2. zshrc\n3. tmuxconf\n4. bashrc\n"
    exit 0
}

# Get user input
arg=$1

# Run the setup
if [ $# -gt 0 ]; then
    if [ "$arg" == "--help" ]; then
	help
    else
	setup $arg
    fi
else
    for file in $dotfiles; do
	setup $file
    done
fi
