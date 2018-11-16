#!/bin/bash

# make directories
if [[ ! -d ~/src ]]; then
  mkdir -p ~/src
fi

mkdir /tmp/bootstrap

# gen ssh key
if [[ ! -f ~/.ssh/id_rsa ]]; then
  ssh-keygen -t rsa -b 4096
fi

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install brew packages
brew install -y git vim node

# configure git
curl -L https://raw.githubusercontent.com/github/gitignore/master/Global/macOS.gitignore > ~/.gitignore
git config --global core.excludesfile ~/.gitignore

# download iterm2
curl -L https://iterm2.com/downloads/stable/latest > /tmp/bootstrap/iterm.zip
unzip /tmp/bootstrap/iterm.zip -d /Applications

# download iterm themes
git clone https://github.com/mbadolato/iTerm2-Color-Schemes ~/src/iTerm2-Color-Schemes

# download vscode
curl -L https://update.code.visualstudio.com/latest/darwin/stable > /tmp/bootstrap/vscode.zip
unzip /tmp/bootstrap/vscode.zip -d /Applications

# download chrome
curl -L https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg > /tmp/bootstrap/googlechrome.dmg
hdiutil attach /tmp/bootstrap/googlechrome.dmg
cp -R "/Volumes/Google Chrome/Google Chrome.app" /Applications
hdiutil detach `hdiutil info | grep "Google Chrome" | cut -f1 | grep -oe '.*disk[0-9]*'`

# download powerlevel9k
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

# install oh-my-zsh (this needs to be last because it takes over the active shell)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
