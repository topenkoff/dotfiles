LOCAL_BIN=/usr/local/bin

plugins=(
    git
    docker
    docker-compose
    kubectl
    cargo
)

### starship
if [[ -d "$LOCAL_BIN/starship" ]]; then
    eval "$(starship init zsh)"
fi

### pyenv
if [[ -d "$HOME/.pyenv" ]]; then
    export PATH="$HOME/.pyenv/bin:$PATH"
    eval "$(pyenv init -)"
fi

### poetry
if [[ -d "$HOME/.poetry" ]]; then
    export PATH="$HOME/.poetry/bin:$PATH"
    export POETRY_VIRTUALENVS_IN_PROJECT=true
fi

### cargo
if [[ -d "$HOME/.cargo" ]]; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi

### golang
if [[ ! -e "$HOME/.go" ]]; then
    mkdir "$HOME/.go"
fi

if [[ -d "$HOME/.go" ]]; then
    export GOPATH="$HOME/.go"
    if [[ -d "$HOME/.go/bin" ]]; then
        export PATH="$GOPATH/bin:$PATH"
    fi
fi

### homebrew
if [[ -d "$LOCAL_BIN/brew" ]]; then
    export HOMEBREW_NO_AUTO_UPDATE=1
fi

### k8s
if [[ -d "$LOCAL_BIN/kubectl" ]]; then
    export KUBECONFIG="$HOME/.kube/kubeconfig"
fi

export GPG_TTY=$(tty)
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh
[ -f $HOME/.func_tools.sh ] && source $HOME/.func_tools.sh

### aliases
alias ll="ls -laGh"
