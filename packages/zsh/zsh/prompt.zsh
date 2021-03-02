precmd() {
    vcs_segment=""
    git_branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [ ! -z "$git_branch" ]; then
        vcs_segment="$git_branch"
        git_status=$(git status --porcelain)
        if [ ! -z "$git_status" ]; then
            vcs_segment="$vcs_segment*"
        fi
        vcs_segment=" %F{yellow}$vcs_segment"
    fi
}

if [ "$EUID" = 0 ]; then
    user_color="red"
else
    user_color="green"
fi

PROMPT="%B%F{$user_color}%n%F{white}@%F{blue}%m %F{magenta}%5~\${vcs_segment}%F{white} %# %b%f%k"
RPROMPT="%(?..%B%F{white}%K{196} %? %b%f%k)"
ZLE_RPROMPT_INDENT=-1

unset user_color
