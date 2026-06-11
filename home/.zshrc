setopt inc_append_history

source_if() { [ -f $1 ] && source $1 1> /dev/null ; }
path_if() { [ -d $1 ] && export PATH="$1:$PATH" ; }

LOCAL_BIN="/usr/local/bin"

### shell
# prompt
[ -f "$LOCAL_BIN/starship" ] && eval "$(starship init zsh)"

# tools
source_if "$HOME/.fzf.zsh"
source_if "$(brew --prefix)/etc/bash_completion"

# aliases
alias ll="ls -laGh"
alias l="ls -laGh"
alias ..="cd .."
alias venv="source .venv/bin/activate"
alias afk="pmset displaysleepnow"
alias ttl="sudo sysctl -w net.inet.ip.ttl=65"

### dev
# python
[ -d "$HOME/.pyenv" ] \
    && export PATH="$HOME/.pyenv/bin:$PATH" \
    && eval "$(pyenv init --path)"
path_if "$HOME/.poetry/bin"
export POETRY_VIRTUALENVS_IN_PROJECT=true

# rust
path_if "$HOME/.cargo/bin"

# k8s
[ -d "$LOCAL_BIN/kubectl" ] && export KUBECONFIG="$HOME/.kube/kubeconfig"

# brew
if [[ -n `which brew` ]]; then
    export HOMEBREW_NO_AUTO_UPDATE=1
    export HOMEBREW_NO_EMOJI='1'
    export HOMEBREW_NO_ANALYTICS='1'
    source_if "$(brew --prefix)/etc/bash_completion"
fi

path_if "$HOME/.local/bin"

# GNU utils
path_if "/usr/local/opt/gnu-sed/libexec/gnubin"
path_if "/usr/local/opt/coreutils/libexec/gnubin/bin"

# gpg
#unset SSH_AGENT_PID
#if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
#    export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
#fi

export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null

#export PATH="/Library/Developer/CommandLineTools/usr/bin:$PATH"

#export LDFLAGS="-L/usr/local/opt/zlib/lib"
#export LDFLAGS="-L/usr/local/opt/bzip2/lib"
#export CPPFLAGS="-I/usr/local/opt/zlib/include"
#export CPPFLAGS="-I/usr/local/opt/bzip2/include"

path_if "$HOME/bin"
path_if "$HOME/go/bin"

source_if "$HOME/.zshrc.local"
alias flush='clear'
