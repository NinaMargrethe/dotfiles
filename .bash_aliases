#!/bin/bash/

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	 test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
     alias ls='ls --color=auto'
fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF' 

alias grep='grep --color=auto'
alias catclip='xclip -selection -c'
alias ahoy='sails lift'
alias rebash='source ~/.bashrc'
alias lstree="ls -R | grep \":$\" | sed -e 's/:$//' -e 's/[^-][^\/]*\// /g' -e 's/^/ /'"
alias startx="startx /usr/bin/gnome-session-fallback"
