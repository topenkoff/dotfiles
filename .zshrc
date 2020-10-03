# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git docker docker-compose kubectl)
source $ZSH/oh-my-zsh.sh

### pyenv
if [[ -d "$HOME/.pyenv" ]]; then
    export PATH="$HOME/.pyenv/bin:$PATH"
    eval "$(pyenv init -)"
fi
###

### poetry
if [[ -d "$HOME/.poetry" ]]; then
    export PATH="$HOME/.poetry/bin:$PATH"
fi
###

### cargo
if [[ -d "$HOME/.cargo" ]]; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi
###

### golang
if [[ ! -e "$HOME/.go" ]]; then
    mkdir "$HOME/.go"
elif [[ -d "$HOME/.go" ]]; then
    export GOPATH="$HOME/.go"
    if [[ -d "$HOME/.go/bin" ]]; then
        export PATH="$GOPATH/bin:$PATH"
    fi
fi
###

alias ll="ls -laGh"