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

if [ -f ~/.bashrc ]; then
	alias rebash='source ~/.bashrc'
elif [ -f ~/.bash_profile ]; then
	alias rebash='source ~/.bash_profile'
fi

alias grep='grep -in --color=auto'
alias catclip='xclip -selection -c'
alias ahoy='sails lift'
alias lstree="ls -R | grep \":$\" | sed -e 's/:$//' -e 's/[^-][^\/]*\// /g' -e 's/^/ /'"
alias startx="startx /usr/bin/gnome-session-fallback"
alias rmregistry="/usr/local/java/jdk1.7.0_45/bin/rmiregistry"
alias dbmongo='mongod --dbpath=/data --port 27017 --rest'
alias mongonuke="mongo --quiet --eval 'db.getMongo().getDBNames().forEach(function(i){db.getSiblingDB(i).dropDatabase()})'"
alias incognito="/opt/google/chrome/chrome --incognito"

# Git aliases
alias ggrep='git grep -in'
## Deletes multiple branches from local and remote
alias grm='f(){ git branch -D "$@"; git branch -rD "$@"; }'
