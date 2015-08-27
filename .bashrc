# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

HISTCONTROL=ignoreboth
HISTSIZE=20000
HISTFILESIZE=20000
shopt -s histappend
shopt -s checkwinsize

PATH="$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
PS1='\[\e[0;33m\]\w\$\[\e[0m\] '

export LC_CTYPE="en_US.UTF-8"
export LESS="-R"
export TZ="/usr/share/zoneinfo/Australia/Melbourne"
export EDITOR="vim"

# set the default name for the terminals in screen.
[[ "$TERM" =~ "screen" ]] && PROMPT_COMMAND='echo -ne "\033k$HOSTNAME\033\\"'

# SOURCE EXTRAS
for file in $HOME/.bash_aliases                                 \
            $HOME/.bash_functions                               \
            $HOME/Repos/bash-my-aws/*-functions                 \
            $HOME/.bash_login
do
  [[ -f $file ]] && source $file
done

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

