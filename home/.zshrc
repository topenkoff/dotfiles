export HISTSIZE=100000
export SAVEHIST=100000

setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt EXTENDED_HISTORY

export LANG="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

source_if() { [ -f $1 ] && source $1 1> /dev/null ; }

backup() { mv "${1}" "${1}.bk" }

unbackup() { [[ "${1}" =~ \.bk$ ]] && mv ${1} ${1%.bk} || echo "$1: No such file or directory" }

export_path_if() { [ -d $1 ] && export PATH="$1:${PATH}"] }

### shell
# prompt
[ -f "/usr/local/bin/starship" ] && eval "$(starship init zsh)"

# tools
source_if "$HOME/.fzf.zsh"
fpath=(/opt/homebrew/share/zsh/site-functions $fpath)

# aliases
alias ll="ls -laGhF"
alias l="ls -laGh"
alias ..="cd .."
alias venv="source .venv/bin/activate"
alias afk="pmset displaysleepnow"
alias ttl="sudo sysctl -w net.inet.ip.ttl=65"
alias flush="clear; tmux clear-history"

### dev
# python
[ -d "$HOME/.pyenv" ] \
    && export PATH="$HOME/.pyenv/bin:$PATH" \
    && eval "$(pyenv init --path)"
[ -d "$HOME/.poetry" ] && export PATH="$HOME/.poetry/bin:$PATH"
export POETRY_VIRTUALENVS_IN_PROJECT=true

export_path_if "$HOME/.cargo/bin"

export_path_if "$HOME/go/bin"

# k8s
[ -d "/usr/local/bin/kubectl" ] && export KUBECONFIG="$HOME/.kube/kubeconfig"

# brew
if [[ -n `which brew` ]]; then
    export HOMEBREW_NO_AUTO_UPDATE=1
    export HOMEBREW_NO_EMOJI='1'
    export HOMEBREW_NO_ANALYTICS='1'
    source_if "$(brew --prefix)/etc/bash_completion"
fi

export_path_if "$HOME/.local/bin"
export_path_if "/opt/homebrew/opt/gnu-sed/libexec/gnubin"
export_path_if "/usr/local/opt/coreutils/libexec/gnubin/bin"
export_path_if "/opt/homebrew/opt/coreutils/libexec/gnubin"

## gpg
# unset SSH_AGENT_PID
# if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
#     export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
# fi

export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null

export PATH="$HOME/bin:$PATH"

source_if "$HOME/.zshrc.local"


## The following lines were added by compinstall

# zstyle ':completion:*' completer _complete _ignored
# zstyle :compinstall filename '/Users/dakayshev/.zshrc'
# #
# autoload -Uz compinit
# compinit

## End of lines added by compinstall

disable -r time
alias time='time -p '
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

# vi mode for edit command
export VISUAL=nvim
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

export_path_if "/opt/homebrew/Cellar/grep/3.11/libexec/gnubin"
export_path_if "/opt/homebrew/opt/node@20/bin"

# if [ -z "$SSH_AUTH_SOCK" ] ; then
#     ssh-add
# fi

alias bk='backup'
alias unbk='unbackup'
