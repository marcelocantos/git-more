PS1='\[\e[1m\]\h:$(__gitty_ps1 "(±\[\e[4m\]%s\[\e[24m\])") \u\$\[\e[0m\] '

__gitty_ps1 ()
{
    if git rev-parse --is-inside-git-dir >/dev/null 2>&1; then
        local gitroot="$(dirname $(__gitdir))"
        [ "$gitroot" == "." ] && gitroot="$PWD"
        __git_ps1 "${gitroot/#$HOME/~}$1${PWD#$gitroot}"
    else
        printf "${PWD/#$HOME/~}"
    fi
}
