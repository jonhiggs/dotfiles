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

export LC_CTYPE="en_US.UTF-8"
export LESS="-R"
export TZ="/usr/share/zoneinfo/Australia/Melbourne"
export EDITOR="nvim"
export NVIM_LISTEN_ADDRESS="/tmp/nvim"

__my_prompt_command() {
  exit_status=$?
  eval $(bash_environment)
  type rea-as-stick &> /dev/null && rea-as-stick

  if [[ ${exit_status} -eq 0 ]]; then
    # PS1 is normally yellow
    PS1='\[\e[0;33m\]\w\$\[\e[0m\] '
  else
    # PS1 is red when the last command returns non-zero exit status
    PS1='\[\e[0;31m\]\w\$\[\e[0m\] '
  fi
}

PROMPT_COMMAND="__my_prompt_command"

# SOURCE EXTRAS
for file in $HOME/etc/dotfiles/bash/functions.inc                 \
            $HOME/.bash_environment                               \
            $HOME/Repos/bash-my-aws/lib/*-functions               \
            $HOME/Repos/bash-my-aws/custom/*                      \
            $HOME/Repos/rea-as-switcher/rea-as-switcher.inc       \
            $HOME/etc/dotfiles/bash/aliases.inc                   \
            $HOME/etc/dotfiles/bash/rvm                           \
            $HOME/etc/dotfiles/bash/virtualenvwrapper             \
            $HOME/etc/dotfiles/bash/golang                        \
            $HOME/etc/dotfiles/bash/java                          \
            $HOME/etc/dotfiles/bash/ssh                           \
            $HOME/etc/dotfiles/bash/bash_completion               \
            $HOME/etc/dotfiles/bash/ls                            \
            $HOME/etc/dotfiles/bash/tmux                          \
            $HOME/etc/dotfiles/bash/arduino                       \
            $HOME/etc/dotfiles/bash/less                          \
            $HOME/etc/dotfiles/bash/ghost                         \
            $HOME/.aws_credentials
do
  [[ -f $file ]] && source $file
done
