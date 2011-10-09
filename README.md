# git-more

This is a holding area for little knick-knacks I've created to make using git easier. Right now, there's just one little enhancement, called `__gitmore_ps1`...

## __gitmore_ps1

This script improves the way git branches, etc., appear on the command-line. It relies on [git-completion.bash][1], which is part of the git source distribution, and also comes for free with `brew install git bash-completion`.

The purpose of this enhancement is to indicate the current branch, etc., just as `__git_ps1` does now. But instead of placing the information in some fixed location, `__gitmore_ps1` automatically places it immediately after the git repository's root directory, somewhere in the middle of the path. For example, if I am in the `src` subdirectory of my `~/work/wickdapp` git project, the command-line appears like so:

    mybox:~/work/wickdapp(±master)/src marcelo$ _

Note that the `(±...)` (the guts of which is just whatever `__git_ps1 "%s"` outputs) appears immediately after `wickdapp`, which is the root directory of the git project — i.e., the one containing `.git`. The remainder of the path comes after that.

### Motivation

1. This was largely an exercise in familiarising myself with git-completion.bash.
1. I find it handy to know how deep within a project's directory tree I am; it makes it slightly easier to mentally parse path references appearing in git output.
1. It just feels right to have `(±...)` at the same level as `.git`.

### Installation

1. Install git-completion.bash
1. Paste the contents of `git-more.sh` into `~/.bash_profile`.
1. Comment and uncomment pasted environment variables to taste.

Start a new shell and `cd` to a git repository to see the results.

### Notes

1. If you already have a customised `PS1`, you'll have to figure out for yourself where to slot the relevant snippet — `$(__gitmore_ps1 "(±\[\e[4m\]%s\[\e[24m\])")` — and remember to remove any `\w` or `\W`, since `__gitmore_ps1` emulates `\w`.
1. You can, of course, customise this to your heart's content. Just be careful with ANSI escapes. They must all appear inside a pair of `\[...\]` on the `PS1=...` line. Otherwise, line wrapping will go all fruity on you.

### Bugs

1. Placement of the `(±...)` is a slightly broken when you `cd` into the `.git` directory.

  [1]: https://github.com/markgandolfo/git-bash-completion
