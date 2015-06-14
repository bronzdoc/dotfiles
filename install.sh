#!/usr/bin/env bash

#********************************
# Author: luis Sagastume
# Email: lsagastume1990@gmail.com
# install.sh
# Setup for dotfiles
#********************************

# Create directory to backup files
if [ ! -d "$PWD/backups" ]; then
    mkdir "$PWD/backups"
fi

#************************************
# Helper functions to setup each file
#************************************
function set_vimrc()
{
    if [ ! -f ~/.vimrc ]; then
	ln -s "$PWD/vimrc" ~/.vimrc
	if [ $? -eq 0 ]; then
	    echo "Setting up vim"
	fi
    fi
}

function set_bashrc()
{
    if [ ! -f ~/.bashrc ]; then
	ln -s "$PWD/bashrc" ~/.bashrc
	if [ $? -eq 0 ]; then
	    echo "Setting up bash"
	fi
    else
        file="bashrc"
	echo -n "$file already exists, do you want to update it [y/n]: "
	read update
        old_file="bashrc-$(date +%m-%d-%Y)"
	if [ "$update" == "y" ]; then
	    mv ~/.bashrc ~/"$old_file"; mv ~/"$old_file" "$PWD/backups"
	    ln -s "$PWD/bashrc" ~/.bashrc
	    if [ $? -eq 0 ]; then
		echo "Setting up bash"
	    fi
	fi
    fi
}


function set_zshrc()
{
    if [ ! -f ~/.zshrc ]; then
	ln -s "$PWD/zshrc" ~/.zshrc
	if [ $? -eq 0 ]; then
	    echo "Setting up zsh"
	fi
    fi
}

function set_tmuxconf()
{
    if [ ! -f ~/.tmux.conf ]; then
	ln -s "$PWD/tmux.conf" ~/.tmux.conf
	if [ $? -eq 0 ]; then
	    echo "Setting up tmux"
	fi
    fi
}

function help()
{
    printf "Setup a specific file passing one of the following arguents:\n"
    printf "1. vimrc\n2. zshrc\n3. tmuxconf\n4. bashrc\n"
    exit 0
}

#Get user input
arg=$1

if [ "$arg" == "--help" ]; then
    help
fi

if [ $# -gt 0 ]; then
    case "$arg" in
	vimrc)
	    set_vimrc
	    ;;
	zshrc)
	    set_zshrc
	    ;;
	bashrc)
	    set_bashrc
	    ;;
	tmuxconf)
	    set_tmuxconf
	    ;;
	*)
	    help
	    ;;
    esac
else
    set_vimrc
    set_zshrc
    set_bashrc
    set_tmuxconf
fi
