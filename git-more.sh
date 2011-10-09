#----------------------------------------------------------------
# git-more.sh
#

PS1='\[\e[1m\]\h:$(__gitmore_ps1 "(±\[\e[4m\]%s\[\e[24m\])") \u\$\[\e[0m\] '

# These are very handy. I don't know why they're not the default.
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM=1

# I don't use this. It's just here as a hint. Pick only one style.
#GIT_PS1_DESCRIBE_STYLE=contains|branch|describe|default

__gitmore_ps1 ()
{
    if git rev-parse --is-inside-git-dir >/dev/null 2>&1; then
        local gitroot="$(dirname $(__gitdir))"
        [ "$gitroot" == "." ] && gitroot="$PWD"
        __git_ps1 "${gitroot/#$HOME/~}$1${PWD#$gitroot}"
    else
        printf "${PWD/#$HOME/~}"
    fi
}
