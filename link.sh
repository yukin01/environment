#!/bin/bash
set -eu
DOT_DIRECTORY="${HOME}/dotfiles"

echo "make dotfile's symbolic link"
for f in .??*; do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue

    ln -snfv $DOT_DIRECTORY/$f $HOME/$f
done
