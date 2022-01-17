unset LSCOLORS
LOCAL_BIN=/usr/local/bin

### shell
# prompt
[ -f "$LOCAL_BIN/starship" ] && eval "$(starship init zsh)"

# tools
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh
[ -f $HOME/.tools.sh ] && source $HOME/.tools.sh
[ -f $HOME/.tools.zsh ] && [ $SHELL = "/bin/zsh" ] && source $HOME/.tools.zsh

# aliases
alias ll="ls -laGh"
alias l="ls -laGh"
alias ..="cd .."
alias venv="source .venv/bin/activate"
alias afk="pmset displaysleepnow"
alias ttl="sudo sysclt -w net.inet.ip.ttl=65"

### dev
# python
[ -d "$HOME/.pyenv" ] && export PATH="$HOME/.pyenv/bin:$PATH" && eval "$(pyenv init --path)"
[ -d "$HOME/.poetry" ] && export PATH="$HOME/.poetry/bin:$PATH"
export POETRY_VIRTUALENVS_IN_PROJECT=true

# rust
[ -d "$HOME/.cargo" ] && export PATH="$HOME/.cargo/bin:$PATH"

# golang
[ -d "$HOME/.go" ] && export GOPATH="$HOME/.go"
[ -d "$HOME/.go/bin" ] && export PATH="$GOPATH/bin:$PATH"

# k8s
[ -d "$LOCAL_BIN/kubectl" ] && export KUBECONFIG="$HOME/.kube/kubeconfig"

# brew
[ -f "$LOCAL_BIN/brew" ] && export HOMEBREW_NO_AUTO_UPDATE=1

[ -d "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin:$PATH"

# gpg
export GPG_TTY=$(tty)
#unset SSH_AGENT_PID
#if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
#  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
#fi

#export PATH="/Library/Developer/CommandLineTools/usr/bin:$PATH"
#export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
#export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"
