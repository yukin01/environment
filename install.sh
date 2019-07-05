#!/bin/bash
set -eu

# oh-my-zsh
echo "===== install oh-my-zsh ====="
if [ -d ~/.oh-my-zsh ]; then
    echo "already installed"
else
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    ./fonts/install.sh
    cp ./cobalt2/cobalt2.zsh-theme ~/.oh-my-zsh/themes/
    echo "please change iTerm2 settings"
fi

# ruby
echo "===== install ruby via rbenv ====="
if which ruby | grep .rbenv >/dev/null; then 
    echo "already installed"
else
    eval "$(rbenv init -)"
    rbenv install 2.5.1
    rbenv global 2.5.1
    rbenv rehash
fi
echo "
path: $(which ruby)
version: $(ruby -v)
"

# bundler
echo "===== install bundler via gem ====="
# which bundle > /dev/null 2>&1 || gem install bundler
if which bundle > /dev/null; then
    echo "already installed"
else
    gem install bundler
fi
echo "
path: $(which bundler)
version: $(bundler -v)
"

# node
echo "===== install node via nodebrew ====="
if which node | grep .nodebrew >/dev/null; then 
    echo "already installed"
else
    mkdir -p ~/.nodebrew/src
    nodebrew install stable
    nodebrew use stable
fi
echo "
node_path: $(which node)
node_version: $(node -v)

npm_path: $(which npm)
npm_version: $(npm -v)
"
# echo "npm_path: $(which npm)\nnpm_version: $(npm -v)\n"

# go
echo "===== install go via goenv ====="
if which go | grep .goenv >/dev/null; then 
    echo "already installed"
else
    goenv install 1.11.2
    goenv global 1.11.2
    goenv rehash
fi
echo "
path: $(which go)
version: $(go version)
"

echo "Installed successfully"
