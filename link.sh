#!/bin/bash
set -eu
DOTFILES_DIR="${HOME}/dotfiles/files"

echo "===== make dotfile's symbolic link ====="
cd $DOTFILES_DIR
for f in .??*; do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".gitmodules" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue

    ln -snfv $DOTFILES_DIR/$f $HOME/$f
done
