# Force the locale to American English (UTF-8)
export LANG=en_US.UTF-8

# If we're not inside tmux, then start tmux
# We also start tmux if the parent process is sshd
if command -v tmux>/dev/null; then
    if [ -z $TMUX ] && [[ ! $TERM == screen* ]] && [[ ! $TERM == tmux* ]] && [[ ! $TERM_PROGRAM == vscode ]]; then
        exec tmux -2 new-session -A -s Untitled
    elif [[ "$(uname -o 2>/dev/null)" != "Cygwin" ]]; then
        PARENT=$(ps -o comm= -p $PPID)
        case "$PARENT" in
            sshd|*/sshd) exec tmux -2 new-session -A -s Untitled ;;
        esac
    fi
fi

# We need to reload xenv
if command -v xenv >/dev/null 2>&1; then
    eval "$(xenv init - $SHELL)"
fi

if command -v 'reattach-to-user-namespace' >/dev/null; then
    if [ -z "$REATTACH_TO_USER_NAMESPACE" ]; then
        export REATTACH_TO_USER_NAMESPACE=1
        exec reattach-to-user-namespace zsh
    fi
fi

if [ -e "$HOME/.dotfiles/bin" ]; then
    export PATH="$HOME/.dotfiles/bin:$PATH"
fi

find_variant() {
    for p in "$@"; do
        if command -v "$p" >/dev/null 2>&1; then
            echo $p
            return
        fi
    done
}

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export LS_COLORS="di=1;34:ln=1;35:so=1;31:pi=1;33:ex=1;32:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
export PAGER=$(find_variant most less more)
export VISUAL=$(find_variant code nvim vim vi)
export EDITOR="$VISUAL"

source "$HOME/.config/shell/alias.sh"
