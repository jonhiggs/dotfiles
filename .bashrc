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

[[ "${TERM}" == "xterm" ]] && export TERM="xterm-256color"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
  "xterm-color"|"xterm-256color")    color_prompt=yes;;
esac

if [ "$color_prompt" = yes ]; then
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@'${fqdn}'\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h'${fqdn}':\w\$ '
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

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@${fqdn}: \w\a\]$PS1"
    ;;
*)
    ;;
esac

if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

if [ -f ~/.bash_login ]; then
  source ~/.bash_login
fi

function append_to_path() {
  if [ -d $1 ]; then export PATH=$PATH:$1; fi
}

function prepend_to_path() {
  if [ -d $1 ]; then export PATH=$1:$PATH; fi
}

#prepend_to_path /Library/Frameworks/Python.framework/Versions/2.7/bin
prepend_to_path /usr/local/bin
prepend_to_path ${HOME}/bin
append_to_path ${HOME}/.rvm/bin
append_to_path ${HOME}/opt/deploy/app/bin
append_to_path ${HOME}/opt/httest-2.4.88/src

if [ "$(hostname)" != "waffle" ]; then
  export EC2_INSTANCE_ID=$(ec2-metadata --instance-id | awk '{print $2}')
  export AWS_AZ=$(ec2-metadata --availability-zone | awk '{print $2}')
  export AWS_DEFAULT_REGION=$(echo ${AWS_AZ} | sed 's/[a-z]$//')

  if [[ -f /tmp/ec2-launch-time ]]; then
    export EC2_LAUNCH_TIME=$(cat /tmp/ec2-launch-time)
  else
    export EC2_LAUNCH_TIME=$(
      aws ec2 describe-instances --instance-ids ${EC2_INSTANCE_ID} |
        jshon -e Reservations -e 0 -e Instances -e 0 -e LaunchTime -u
    )
    echo ${EC2_LAUNCH_TIME} > /tmp/ec2-launch-time
  fi
fi

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export LESS="-R"
export TZ="/usr/share/zoneinfo/Europe/Amsterdam"
export EDITOR="vim"
