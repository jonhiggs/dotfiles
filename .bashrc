# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

HISTCONTROL=ignoreboth
HISTSIZE=20000
HISTFILESIZE=20000
shopt -s histappend
shopt -s checkwinsize

PATH="/usr/local/bin:/usr/bin:/bin"
PS1='\u@\h:\w\$ '

# set the default name for the terminals in screen.
[[ "${TERM}" =~ "screen" ]] && PROMPT_COMMAND='echo -ne "\033k$HOSTNAME\033\\"'

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

prepend_to_path ${HOME}/bin
append_to_path  ${HOME}/opt/deploy/app/bin

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
