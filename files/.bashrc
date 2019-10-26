# echo "this is bashrc"

# for anyenv
if [ -d $HOME/.anyenv ]; then
    export PATH=$HOME/.anyenv/bin:$PATH
    eval "$(anyenv init - bash)"
fi

# Set alies
[ -f ~/.envrc ] && . ~/.envrc

# fzf bash completion and key-bindings
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# colorize
if [ $UID -eq 0 ]; then
    PS1="\[\033[31m\]\u@\h\[\033[00m\]:\[\033[01m\]\w\[\033[00m\]\\$ "
else
    PS1="\[\033[36m\]\u@\h\[\033[00m\]:\[\033[01m\]\w\[\033[00m\]\\$ "
fi
