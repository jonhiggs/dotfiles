# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

HISTCONTROL=ignoreboth
HISTSIZE=20000
HISTFILESIZE=20000
shopt -s histappend
shopt -s checkwinsize

XDG_CONFIG_HOME="${HOME}/.config"
XDG_DATA_HOME="${HOME}/Library"
XDG_CACHE_HOME="${HOME}/Library/Caches"

PATH="$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

__my_prompt_command() {
  exit_status=$?
  aws_load
  eval $(bash_environment)

  if [[ ${exit_status} -eq 0 ]]; then
    # PS1 is normally yellow
    PS1='\[\e[0;33m\]\w\$\[\e[0m\] '
  else
    # PS1 is red when the last command returns non-zero exit status
    PS1='\[\e[0;31m\]\w\$\[\e[0m\] '
  fi
}

PROMPT_COMMAND="__my_prompt_command"
export LC_CTYPE="en_US.UTF-8"
export LESS="-R"
export TZ="/usr/share/zoneinfo/Australia/Melbourne"
export EDITOR="nvim"
export NVIM_LISTEN_ADDRESS="/tmp/nvim"

# SOURCE EXTRAS
for file in $HOME/.bash_aliases                      \
            $HOME/.bash_functions                    \
            $HOME/.bash_environment                  \
            $HOME/Repos/bash-my-aws/lib/*-functions  \
            $HOME/Repos/bash-my-aws/custom/*         \
            $HOME/Repos/aws_prompt/lib.inc           \
            $HOME/.bash_login                        \
            $HOME/.aws_credentials
do
  [[ -f $file ]] && source $file
done

# WARN WITH HOST ENTRIES
if ! \ghost list | grep 'Listing 0 host' &> /dev/null; then
  echo "YOU HAVE CUSTOM HOSTFILE ENTRIES (ghost bust)"
fi
