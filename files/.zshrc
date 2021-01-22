#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# for anyenv
#if [ -d $HOME/.anyenv ]; then
#  export PATH=$HOME/.anyenv/bin:$PATH
#  eval "$(anyenv init - zsh)"
#fi

# for asdf
if [ -d $HOME/.asdf ]; then
  source $HOME/.asdf/asdf.sh
  fpath=(${ASDF_DIR}/completions $fpath)
  autoload -Uz compinit && compinit
fi

# for gcloud on macos
if type brew > /dev/null 2>&1; then
  export CLOUDSDK_PYTHON="$(brew --prefix)/opt/python@3.8/libexec/bin/python"
  source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
  source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
fi

# set alies
[ -f $HOME/.envrc ] && source $HOME/.envrc

# set vi keybind
bindkey -v

# for kubectl completion
type kubectl &>/dev/null && source <(kubectl completion zsh)

# for awscli completion
#if type aws_completer &>/dev/null; then
#  complete -C aws_completer aws
#  complete -C aws_completer aws-vault
#fi

# Additional zsh completions
# fpath=($HOME/dotfiles/completions/zsh $fpath)
# autoload -Uz compinit && compinit

# fzf zsh completion and key-bindings
function () {
  local fzf_mac_dir="/usr/local/opt/fzf/shell"
  local fzf_ubuntu_dir="/usr/share/doc/fzf/examples"
  for dir in $fzf_mac_dir $fzf_ubuntu_dir; do
#    [ -f $dir/completion.zsh ] && source $dir/completion.zsh
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

# autoload only once
#autoload -U compinit && compinit

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Setup starship
if type starship >/dev/null 2>&1; then
  export STARSHIP_CONFIG=$HOME/.starship.toml
  eval "$(starship init zsh)"
fi

# Profiling
if (which zprof > /dev/null 2>&1) ;then
  zprof | less
fi
