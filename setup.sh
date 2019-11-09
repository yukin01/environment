#!/bin/bash
set -eu

# rbenv
echo "===== install rbenv via anyenv ====="
sleep 0.5
if which rbenv >/dev/null; then
    echo "rbenv is already installed"
else
    anyenv install rbenv
    eval "$(anyenv init -)"
fi
echo ""
echo "path: $(which rbenv)"
echo ""

# nodenv
echo "===== install nodenv via anyenv ====="
sleep 0.5
if which nodenv >/dev/null; then
    echo "already installed"
else
    anyenv install nodenv
    eval "$(anyenv init -)"
fi
echo ""
echo "path: $(which nodenv)"
echo ""

# goenv
# echo "===== install goenv via anyenv ====="
# sleep 0.5
# if which goenv >/dev/null; then
#     echo "already installed"
# else
#     anyenv install goenv
#     eval "$(anyenv init -)"
# fi
# echo ""
# echo "path: $(which goenv)"
# echo ""

# ruby
echo "===== install ruby via rbenv ====="
sleep 0.5
if which ruby | grep .rbenv >/dev/null; then
    echo "already installed"
else
    eval "$(rbenv init -)"
    rbenv install 2.6.3
    rbenv global 2.6.3
    rbenv rehash
fi
echo ""
echo "path: $(which ruby)"
echo "version: $(ruby -v)"
echo ""

# bundler
echo "===== install bundler via gem ====="
sleep 0.5
# one liner sample
# which bundle > /dev/null 2>&1 || gem install bundler
if which bundle > /dev/null; then
    echo "already installed"
else
    gem install bundler
fi
echo ""
echo "path: $(which bundler)"
echo "version: $(bundler -v)"
echo ""

# node
echo "===== install node via nodenv ====="
sleep 0.5
if which node | grep .nodenv >/dev/null; then
    echo "already installed"
else
    nodenv install 10.12.0
    nodenv global 10.12.0
    nodenv rehash
fi
echo ""
echo "node_path: $(which node)"
echo "node_version: $(node -v)"
echo ""
echo "npm_path: $(which npm)"
echo "npm_version: $(npm -v)"
echo ""

# go
# echo "===== install go via goenv ====="
# sleep 0.5
# if which go | grep .goenv >/dev/null; then
#     echo "already installed"
# else
#     goenv install 1.11.2
#     goenv global 1.11.2
#     goenv rehash
# fi
# echo ""
# echo "path: $(which go)"
# echo "version: $(go version)"
# echo ""

# prezto
echo "===== install prezto ====="
sleep 0.5
if [ -d ${ZDOTDIR:-$HOME}/.zprezto ]; then
  echo "already installed"
else
  # prezto
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
  # powerline (font)
  ./fonts/install.sh

  echo ""
  echo "Prezto is installed successfully"
  echo ""

fi

echo "Installed successfully"

