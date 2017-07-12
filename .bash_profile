#Allow color in terminal output
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx 


# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PS1='\[\e[0;36m[\T]\[\e[0;35m nl\]:\e[m\]\[\e[0;32m$\e[m\e[0;93m\e[1;33m$(parse_git_branch)\[\033[00m\] '

