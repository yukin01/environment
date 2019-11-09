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
echo ===== Make SSH directory =====
echo

if [ -d ~/.ssh ]; then
  echo SSH directory already exists.
else
  set -x
  install -m 700 -d ~/.ssh
  set +x
fi
# [ ! -d ~/.ssh ] && install -m 700 -d ~/.ssh

echo
echo ===== Make SSH config file =====
echo

SSH_CONFIG=$(cat <<-EOS
Host *
  ServerAliveInterval 1200
  ServerAliveCountMax 12
  TCPKeepAlive yes
  Compression yes
  GSSAPIAuthentication no
  UseRoaming no
  AddKeysToAgent yes
EOS
)

if [ -f ~/.ssh/config ]; then
  echo SSh config file already exists.
  echo If you need common settings, add manually.
else
  set -x
  echo "$SSH_CONFIG" > ~/.ssh/config
  [ $OS == "Mac" ] && echo "  UseKeychain yes" >> ~/.ssh/config
  set +x
fi

echo
echo ===== Generate SSH key =====
echo

if [ -f ~/.ssh/id_rsa ] && [ -f ~/.ssh/id_rsa.pub ]; then
  echo SSH key pair already exists.
else
  read -p "Enter your email address: " email
  set -x
  ssh-keygen -t rsa -b 4096 -C $email
  set +x
  echo
  echo Your public key is...
  echo
  cat ~/.ssh/id_rsa.pub
  echo
  read -p "After registering public key, press the enter key: "
fi

echo
echo ===== Set remote repository =====
echo

type git > /dev/null 2>&1 || (echo Please install git && exit 1)
if [ -d ~/dotfiles ]; then
  cd ~/dotfiles
  set -x
  [ -n $DOTFILES_TEST_FLAG ] && export GIT_SSH_COMMAND="ssh -i $HOME/id_rsa"
  git remote set-url origin git@github.com:yukin01/dotfiles.git
  git remote -v
  set +x
fi

echo
echo SSH configuration is are completed successfully!
echo
