#!/bin/bash

# Find OS type
if [[ "$OSTYPE" == "linux-gnu" ]]; then # is Gnu Linux
	#TODO: Implement
	echo TBA
elif [[ "$OSTYPE" =~ "darwin" ]]; then # is MacOS
	cp .bash_aliases ~/.bash_aliases
	cp vimrc ~/.vimrc

	# Move bashrc/bash_profile last so they can be sourced
	if [ -f ~/.bashrc ]; then
		cp .bashrc ~/.bashrc
	elif [ -f ~/.bash_profile ]; then
		cp .bash_profile ~/.bash_profile
		source ~/.bash_profile
	fi
fi
