#!/bin/bash
set -eu

echo "install homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "brew install"
# virtualbox で躓くことがあるので必要なら先にインストールしておく
brew cask install virtualbox
brew bundle

echo "\nPreinstalled successfully"
