# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/topenkoff/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git docker docker-compose)
source $ZSH/oh-my-zsh.sh

export GPG_TTY=`tty`
# pyenv
# export PATH="$HOME/.pyenv/bin:$PATH"
# # poetry
# export PATH="$HOME/.cargo/bin:$PATH"
# # cargo
# export PATH="$HOME/.poetry/bin:$PATH"

alias ll='ls -laGh'
