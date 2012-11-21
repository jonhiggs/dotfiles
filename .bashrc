# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=20000
HISTFILESIZE=20000

# a fix for iterm2
export LC_CTYPE="en_US.UTF-8"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set the default name for the terminals in screen.
if [ `echo ${TERM} | grep -c '^screen'` -ne 0 ]; then
  PROMPT_COMMAND='echo -ne "\033k$HOSTNAME\033\\"'
fi

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
  xterm-color) color_prompt=yes;;
  xterm-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
  else
    color_prompt=
  fi
fi

color_prompt=no
fqdn=`hostname -f`

if [ "$color_prompt" = yes ]; then
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@'${fqdn}'\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
  PS1='${debian_chroot:+($debian_chroot)}\u@'${fqdn}':\w\$ '
fi

if [ `uname` == 'Linux' ]; then
  # enable red/yellow/green ps1 depending on environment.
  case `dnsdomainname` in
    t.layar.com)
      PS1="\033[01;32m\]${PS1}\033[00m\]"
    ;;
    s.layar.com)
      PS1="\033[01;33m\]${PS1}\033[00m\]"
    ;;
    layar.com)
      PS1="\033[01;31m\]${PS1}\033[00m\]"
    ;;
  esac
fi

unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@${fqdn}: \w\a\]$PS1"
    ;;
*)
    ;;
esac


# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
  . /etc/bash_completion
fi

if [ -f /usr/local/etc/bash_completion.d ] && ! shopt -oq posix; then
  . /etc/bash_completion
fi

if [ -d ~/.bash_completion.d ] && ! shopt -oq posix; then
  for file in ~/.bash_completion.d/*; do
    . $file
  done
fi

# bash completion for brew
if [ -f /usr/local/bin/brew ]; then
  if [ -f `brew --prefix`/etc/bash_completion ]; then
      . `brew --prefix`/etc/bash_completion
  fi
fi

function append_to_path() {
  if [ -d $1 ]; then export PATH=$PATH:$1; fi
}

# SOURCE IN RVM
if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then
  source "$HOME/.rvm/scripts/rvm"
fi

append_to_path ${HOME}/.rvm/bin
append_to_path ${HOME}/dotfiles/bin
append_to_path ${HOME}/Repos/dotfiles/bin


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# SOURCE IN AWS
if [ -f ~/Repos/aws-production/etc/environment ]; then
  source ~/Repos/aws-production/etc/environment
fi
