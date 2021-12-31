source $HOME/.oh-my-zsh/oh-my-zsh.sh
LOCAL_BIN=/usr/local/bin

plugins=(
    git
    docker
    docker-compose
    kubectl
    cargo
)

### shell
# prompt
[ -f "$LOCAL_BIN/starship" ] && eval "$(starship init zsh)"

# tools
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh
[ -f $HOME/.func_tools.sh ] && source $HOME/.func_tools.sh

# aliases
alias ll="ls -laGh"

### dev
# python
[ -d "$HOME/.pyenv" ] && export PATH="$HOME/.pyenv/bin:$PATH" && eval "$(pyenv init --path)"
[ -d "$HOME/.poetry" ] && export PATH="$HOME/.poetry/bin:$PATH" && export POETRY_VIRTUALENVS_IN_PROJECT=true

# rust
[ -d "$HOME/.cargo" ] && export PATH="$HOME/.cargo/bin:$PATH"

# golang
[ -d "$HOME/.go" ] && export GOPATH="$HOME/.go"
[ -d "$HOME/.go/bin" ] && export PATH="$GOPATH/bin:$PATH"

# k8s
[ -d "$LOCAL_BIN/kubectl" ] && export KUBECONFIG="$HOME/.kube/kubeconfig"

# brew
[ -f "$LOCAL_BIN/brew" ] && export HOMEBREW_NO_AUTO_UPDATE=1

# gpg
export GPG_TTY=$(tty)

[ -d "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin:$PATH"
