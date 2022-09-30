# Only continue running this script if bash is interactive.
[[ "$-" != *i* ]] && return

# .profile contains non-shell specific items.  Source that
[[ -r ~/.profile ]] && . ~/.profile

# Bash interactive shell config for non-login shells
[[ -r ~/.bash_prompt ]] && . ~/.bash_prompt

if keychain > /dev/null 2>&1; then
    eval $(keychain --eval --quiet --agents ssh,gpg id_rsa)
fi

# Tab completion for entries in known_hosts
complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" ssh

# Brew bash completion
if hash brew 2>/dev/null && [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

# Bash completion
if [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
fi

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Don't enter duplicate lines into history
HISTCONTROL=ignoredups:ignorespace

HISTSIZE=2000
HISTFILESIZE=2000

# Check the window size after each command and update LINES and COLS if necessary
shopt -s checkwinsize

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# GPG Agent setup
GPG_TTY=$(tty)
export GPG_TTY

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# vi mode for readline
#set -o vi
#bind -m vi-insert '"jj": vi-movement-mode'
