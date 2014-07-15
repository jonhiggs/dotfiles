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

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set the default name for the terminals in screen.
if [[ "${TERM}" =~ "screen" ]]; then
  PROMPT_COMMAND='echo -ne "\033k$HOSTNAME\033\\"'
fi


# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

# If this is an xterm set the title to user@host:dir
color_prompt=yes
PS1='${debian_chroot:+($debian_chroot)}\u@\h'${fqdn}':\w\$ '
#PS1="\u \w\a\] $ "

# SOURCE EXTRAS
for file in ${HOME}/.bash_aliases ${HOME}/.bash_login; do
  [[ -f $file ]] && source $file
done

function append_to_path() {
  if [ -d $1 ]; then export PATH=$PATH:$1; fi
}

function prepend_to_path() {
  if [ -d $1 ]; then export PATH=$1:$PATH; fi
}

prepend_to_path /usr/local/bin
prepend_to_path ${HOME}/bin
append_to_path  ${HOME}/.rvm/bin
append_to_path  ${HOME}/opt/deploy/app/bin
append_to_path  ${HOME}/opt/httest-2.4.88/src

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

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

export LC_CTYPE="en_US.UTF-8"
export LESS="-R"
export TZ="/usr/share/zoneinfo/Europe/Amsterdam"
export EDITOR="vim"
