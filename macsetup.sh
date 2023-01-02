# change default shell to bash
chsh -s /bin/bash

# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# indispensable tools
brew install wget
brew install vim
brew install gnu-sed # PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
brew install node
brew install git


# dotfiles
cd
wget https://raw.githubusercontent.com/NinaMargrethe/dotfiles/master/.bash_aliases
wget https://raw.githubusercontent.com/NinaMargrethe/dotfiles/master/.bash_profile
wget https://raw.githubusercontent.com/NinaMargrethe/dotfiles/master/.vimrc

source ~/.bash_profile

# devtools
brew install openjdk@17
brew install kotlin
brew tap hashicorp/tap; brew install hashicorp/tap/terraform
brew install terragrunt
brew install azure-cli

