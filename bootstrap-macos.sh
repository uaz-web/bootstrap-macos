#!/bin/bash

# make directories
TEMPDIR=$(mktemp -d)
if [[ ! -d ~/src ]]; then
  mkdir -p ~/src
fi

# gen ssh key
if [[ ! -f ~/.ssh/id_rsa ]]; then
  ssh-keygen -t rsa -b 4096
fi

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install brew packages
brew install -y git vim node

# configure git
curl -L 'https://raw.githubusercontent.com/github/gitignore/master/Global/macOS.gitignore' > ~/.gitignore
git config --global core.excludesfile ~/.gitignore
git config --global init.defaultBranch main

# download iterm2
curl -L 'https://iterm2.com/downloads/stable/latest' > "${TEMPDIR}/iterm.zip" && \
  unzip "${TEMPDIR}/iterm.zip" -d /Applications

# download vscode
curl -L 'https://update.code.visualstudio.com/latest/darwin/stable' > "${TEMPDIR}/vscode.zip" && \
  unzip "${TEMPDIR}/vscode.zip" -d /Applications

# download chrome
curl -L 'https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg' > "${TEMPDIR}/googlechrome.dmg" && \
  open "${TEMPDIR}/googlechrome.dmg"

# download firefox
curl -L 'https://download.mozilla.org/?product=firefox-latest-ssl&os=osx&lang=en-US' > "${TEMPDIR}/firefox.dmg" && \
  open "${TEMPDIR}/firefox.dmg"
