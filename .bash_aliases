#!/bin/bash/

# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	 test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
     alias ls='ls --color=auto'
fi

# Choose bash config file
if [ -f ~/.bashrc ]; then
	alias rebash='source ~/.bashrc'
elif [ -f ~/.bash_profile ]; then
	alias rebash='source ~/.bash_profile'
fi

# General aliases
alias grep='grep -in --color=auto'
alias catclip='xclip -selection -c'

# Linux aliases
alias lstree="ls -R | grep \":$\" | sed -e 's/:$//' -e 's/[^-][^\/]*\// /g' -e 's/^/ /'"
alias startx="startx /usr/bin/gnome-session-fallback"
alias incognito="/opt/google/chrome/chrome --incognito"

# Mac aliases
alias noTunes='sudo chmod 777 /Applications/iTunes.app; sudo rm -r /Applications/iTunes.app/'
## Gatekeeper (sec&priv) shows option allow apps downloaded from anywhere
alias openAnywhere='sudo spctl --master-disable'
alias showHiddenFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'
alias hideHiddenFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder'
showWifiPW(){
	security find-generic-password -w $1;
}
alias showWifiPassword=showWifiPW

# Dev aliases
alias ahoy='sails lift'
alias rmregistry="/usr/local/java/jdk1.7.0_45/bin/rmiregistry"
alias dbmongo='mongod --dbpath=/data --port 27017 --rest'
alias mongonuke="mongo --quiet --eval 'db.getMongo().getDBNames().forEach(function(i){db.getSiblingDB(i).dropDatabase()})'"
alias mvn='mvn -T 1.5C' # mvn runs faster
alias skiptest='-Dmaven.test.skip=true' # run as 'mvn skiptest'

# Git aliases
alias ggrep='git grep -in'
#alias gtree='git log --oneline --decorate --all --graph'
alias gtree='git log --oneline --decorate --all --graph --format=format:"%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n""          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)"'
## Deletes multiple branches from local and remote
deleteBranch(){ git branch -D $1; git push origin --delete $1; };
alias grm=deleteBranch
## Deletes local branches merged to develop
deleteLocalBranchesMerged(){
	branches=$(git branch --merged develop)
	for branch in $branches; do
		if [[ $branch != 'develop' && $branch != 'master' ]]; then 
			echo "Deleting branch $branch" #TODO: For some reason this prints more than just branches
			#git branch -D $branch
		fi
	done
}
alias grm2=deleteLocalBranchesMerged
alias fixpush='git config --global push.default current'
alias fixpull='git branch --set-upstream-to=origin/$(git branch | grep \* | cut -d " " -f2)'
## Reverts to commit and updates remote branch
regretPush(){ git reset --hard $1; git push -f; };
alias gregret=regretPush
## cd into repo folder and prompt for git user email on clone
gclone(){
	git clone $1;
	cd "$(basename "$1" .git)"
	repo=$(git config --get remote.origin.url)
	echo -e "\nPlease set user email for $repo"
	read email
	if [ $email ]; then
		git config user.email $email
		echo "Email set to $(git config user.email)"
	else
		echo "Default email $(git config user.email)"
	fi	
}
alias gclone=gclone
#TODO: port git diff --name-only sha1 sha2 to optional current vs sha
#:$ (master) git diff --name-only master develop
locallog(){
	branch=$(git name-rev --name-only HEAD)
	git log origin/$branch..HEAD
}
