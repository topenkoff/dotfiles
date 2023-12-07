setopt inc_append_history

source_if() { [ -f $1 ] && source $1 1> /dev/null ; }

LOCAL_BIN="/usr/local/bin"

### shell
# prompt
[ -f "$LOCAL_BIN/starship" ] && eval "$(starship init zsh)"

# tools
source_if "$HOME/.fzf.zsh"
source_if "$(brew --prefix)/etc/bash_completion"

#[ -f $HOME/.tools.sh ] && source $HOME/.tools.sh
#[ -f $HOME/.tools.zsh ] && source $HOME/.tools.zsh

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
[ -d "$HOME/.poetry" ] && export PATH="$HOME/.poetry/bin:$PATH"
export POETRY_VIRTUALENVS_IN_PROJECT=true

# rust
[ -d "$HOME/.cargo" ] && export PATH="$HOME/.cargo/bin:$PATH"

# k8s
[ -d "$LOCAL_BIN/kubectl" ] && export KUBECONFIG="$HOME/.kube/kubeconfig"

# brew
if [[ -n `which brew` ]]; then
    export HOMEBREW_NO_AUTO_UPDATE=1
    export HOMEBREW_NO_EMOJI='1'
    export HOMEBREW_NO_ANALYTICS='1'
    source_if "$(brew --prefix)/etc/bash_completion"
fi

[ -d "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin:$PATH"

# GNU utils
[ -d "/usr/local/opt/gnu-sed/libexec/gnubin" ] \
    && export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
[ -d "/usr/local/opt/coreutils/libexec/gnubin/bin" ] \
    && export PATH="/usr/local/opt/coreutils/libexec/gnubin/bin:$PATH"

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
#
export PATH="$HOME/.bin:$PATH"


source_if "$HOME/.zshrc.local"

