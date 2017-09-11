#!/bin/bash

# make directories
(
  cd ~
  mkdir src
)

# gen ssh key
ssh-keygen -t rsa -b 4096

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install brew packages
brew install git
brew install vim
brew install node

# download iterm2
curl -L https://iterm2.com/downloads/stable/latest > /tmp/iterm.zip
unzip /tmp/iterm.zip
mv /tmp/iTerm.app /Applications/.

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# download iterm themes
(
  cd src
  git clone https://github.com/mbadolato/iTerm2-Color-Schemes
)

# download powerlevel9k
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

# download atom
curl -L https://atom.io/download/mac > /tmp/atom.zip
unzip /tmp/atom.zip
mv /tmp/Atom.zip /Applications/.

# download chrome
(
  cd Downloads
  curl -LO https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg
)
