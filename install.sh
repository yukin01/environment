#!/bin/bash
set -eu

OS=""
if [ "$(uname)" == "Darwin" ]; then
  OS="Mac"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ] && \
     [ -f /etc/lsb-release ]; then
  OS="Ubuntu"
else
  echo Unsupported OS
  exit 1
fi

echo ---------------------------
echo Installation type is $OS
echo ---------------------------

echo
echo ===== Clone dotfiles repository =====
echo

type git > /dev/null 2>&1 || (echo Please install git && exit 1)
if [ -d ~/dotfiles ]; then
  echo Dotfiles repository already exists.
else
  set -x
  git clone --recursive https://github.com/yukin01/dotfiles.git ~/dotfiles
  set +x
fi

echo
echo ===== make Dotfiles symbolic link =====
echo

if [ $OS == "Mac" ] || [ $1 == "--force" ]; then
  DOTFILES_DIR="$HOME/dotfiles/files"
  cd $DOTFILES_DIR
  for f in .??*; do
      [[ "$f" == ".git" ]] && continue
      [[ "$f" == ".gitmodules" ]] && continue
      [[ "$f" == ".DS_Store" ]] && continue

      ln -snfv $DOTFILES_DIR/$f $HOME/$f
  done
else
  echo Do nothing.
fi

echo
echo Dotfiles installation is completed successfully!
echo
