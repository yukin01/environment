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

# fzf zsh completion and key-bindings
#
# You should execute install command manually
#   $HOME/go/src/github.com/src/junegunn/fzf/install
# or
#   $(brew --prefix)/opt/fzf/install
#
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ghq zsh completion
fpath_ghq=$GOPATH/src/github.com/motemen/ghq/zsh
[ -d $fpath_ghq ] && fpath=($fpath_ghq $fpath)
autoload -U compinit && compinit
unset fpath_ghq

# Customize to your needs...
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(aws)

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
