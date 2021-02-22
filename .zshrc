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
    export POETRY_VIRTUALENVS_PATH="$HOME/.poetry/virtualenvs"
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

# For run this function you need export env variable 
# with type associative array.

# typeset -A DEV_SLAVE
# DEV_SLAVE[host]=host
# DEV_SLAVE[port]=port
# DEV_SLAVE[dbname]=dbname
# DEV_SLAVE[username]=username
# DEV_SLAVE[password]=password
#
# Where name consists of db enviroment and db replica or only db enviroment.
# Or include file with credentials with structure describe above, 
# for example:
#
# source ${HOME}/.credentials

pgcli () {
    local db="$1:u"
    local replica="$2:u"

    if [[ ! -z "$2" ]]; then
        credentials_template="$db"_"$replica"
    else
        credentials_template="$1:u"
    fi

    typeset -A credentials
    set -A credentials ${(kv)${(P)credentials_template}}

    if [[ -z "$credentials" ]]; then
        echo "Database connection doesn't exists"
        return 
    fi

    PGPASSWORD=$credentials[password] psql \
    --host=$credentials[host] \
    --port=$credentials[port] \
    --username=$credentials[username] \
    --dbname=$credentials[dbname]
}
###

### aliases
alias ll="ls -laGh"
