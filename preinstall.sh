#!/bin/bash
set -eu

echo "===== install homebrew ====="
sleep 0.5
if which brew > /dev/null; then
    echo "already installed"
else
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "===== execute 'brew install' ====="
sleep 0.5
# virtualbox で躓くことがあるので先にインストールしておく
if which virtualbox > /dev/null; then
    echo "Virtualbox is already installed"
else
    brew cask install virtualbox
fi
brew bundle

echo ""
echo "Preinstalled successfully"
