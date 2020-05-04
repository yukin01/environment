#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# for anyenv
if [ -d $HOME/.anyenv ]; then
  export PATH=$HOME/.anyenv/bin:$PATH
  eval "$(anyenv init - zsh)"
fi

# set alies
[ -f ~/.envrc ] && source ~/.envrc

# set vi keybind
bindkey -v

# Additional zsh completions
fpath=($HOME/dotfiles/completions/zsh $fpath)
autoload -U compinit && compinit

# fzf zsh completion and key-bindings
function () {
  # https://qiita.com/mollifier/items/7fdbf15765ccf37f4881
  local fzf_dirs="/usr/share/doc/fzf/examples /usr/local/opt/fzf/shell"
  for dir in "${=fzf_dirs}"; do
    [ -f $dir/completion.zsh ] && source $dir/completion.zsh
    [ -f $dir/key-bindings.zsh ] && source $dir/key-bindings.zsh
  done
}

# aws-vault zsh completion
#if type aws-vault >/dev/null 2>&1; then
#  eval "$(aws-vault --completion-script-zsh)"
#fi

# ghq zsh completion
#fpath_ghq=$GOPATH/src/github.com/motemen/ghq/zsh
#[ -d $fpath_ghq ] && fpath=($fpath_ghq $fpath)
#autoload -U compinit && compinit
#unset fpath_ghq

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Setup starship
if type starship >/dev/null 2>&1; then
  export STARSHIP_CONFIG=~/.starship.toml
  eval "$(starship init zsh)"
fi
