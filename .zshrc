# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git docker docker-compose kubectl)
source $ZSH/oh-my-zsh.sh

export GPG_TTY=`tty`
# pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
# poetry
export PATH="$HOME/.cargo/bin:$PATH"
# cargo
export PATH="$HOME/.poetry/bin:$PATH"
# golang
export GOPATH="$HOME/.go"
export PATH="$GOPATH/bin:$PATH"

alias ll='ls -laGh'
