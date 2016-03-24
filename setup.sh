#!/usr/bin/env bash

#********************************
# Author: luis Sagastume
# Email: lsagastume1990@gmail.com
# setup.sh
# Setup for dotfiles
#********************************

#Dotfiles
dotfiles=".vimrc .nvimrc .zshrc .bashrc .tmux.conf .pryrc .gemrc"

#*********************
# Valid args function
# Cheack valid dotfile
#*********************
function valid_arg()
{
    valid=1
    arg="$1"

    for file in $dotfiles; do
        if [ "$file" == "$arg" ]; then
            valid=0
            break
        fi
    done
    echo $valid
}

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

    # Check input
    is_valid=$(valid_arg "$file")
    if [ $is_valid -eq 1 ]; then
        echo "ERROR: Invalid dotfile \"$file\""
        help
    fi

    if [ ! -e ~/"$file" ]; then
        # "${string#substring}" remove substring from string
        ln -s "$PWD/${file#.}" ~/"$file"
        echo "Setting up $file"
    else
        echo -n "$file file already exists, do you want to update it [y/n]: "
        read update
        if [ "$update" == "y" ]; then
            old_file="${file#.}-$(date +%m-%d-%Y:%c)"
            touch "$PWD/backups/$old_file"
            cp ~/"$file" "$PWD/backups/$old_file"; unlink ~/"$file"
            ln -s "$PWD/${file#.}" ~/"$file"
            echo "$file updated"
        fi
    fi
}

#**********************************
# Clean function
# Remove everything from backup dir
#**********************************
function clean()
{
    rm "$PWD/backups/*"
}

#****************************************
# Help function
# Display available args to setup program
#****************************************
function help()
{
    i=1
    echo "Setup a specific file passing one of the following arguents:"
    for file in $dotfiles; do
        echo "($i) $file"
        i=$((i+1))
    done
    exit 0
}

# Get input
arg=$1

# Run the setup
if [ $# -gt 0 ]; then
    if [ "$arg" == "--help" ]; then
        help
    elif [ "$arg" == "--clean" ]; then
        clean
    else
        setup $arg
    fi
else
    for file in $dotfiles; do
        setup $file
    done
fi
