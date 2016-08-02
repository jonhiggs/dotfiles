# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
[ -z "${PS1}" ] && return

HISTCONTROL=ignoreboth
HISTSIZE=20000
HISTFILESIZE=20000
shopt -s histappend
shopt -s checkwinsize

XDG_CONFIG_HOME="${HOME}/.config"
XDG_DATA_HOME="${HOME}/Library"
XDG_CACHE_HOME="${HOME}/Library/Caches"

PATH="$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

export LANG=C
export LC_CTYPE="en_US.UTF-8"
export TZ="/usr/share/zoneinfo/Australia/Melbourne"

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
for file in ${HOME}/etc/dotfiles/bash/functions.inc                 \
            ${HOME}/.bash_environment                               \
            ${HOME}/Repos/rea-as-switcher/rea-as-switcher.inc       \
            ${HOME}/etc/dotfiles/bash/include.d/aliases.inc         \
            ${HOME}/etc/dotfiles/bash/include.d/arduino             \
            ${HOME}/etc/dotfiles/bash/include.d/bash-my-aws         \
            ${HOME}/etc/dotfiles/bash/include.d/bash_completion     \
            ${HOME}/etc/dotfiles/bash/include.d/df                  \
            ${HOME}/etc/dotfiles/bash/include.d/ghost               \
            ${HOME}/etc/dotfiles/bash/include.d/git                 \
            ${HOME}/etc/dotfiles/bash/include.d/golang              \
            ${HOME}/etc/dotfiles/bash/include.d/grep                \
            ${HOME}/etc/dotfiles/bash/include.d/homebrew            \
            ${HOME}/etc/dotfiles/bash/include.d/java                \
            ${HOME}/etc/dotfiles/bash/include.d/less                \
            ${HOME}/etc/dotfiles/bash/include.d/ls                  \
            ${HOME}/etc/dotfiles/bash/include.d/n                   \
            ${HOME}/etc/dotfiles/bash/include.d/rvm                 \
            ${HOME}/etc/dotfiles/bash/include.d/ssh                 \
            ${HOME}/etc/dotfiles/bash/include.d/tmux                \
            ${HOME}/etc/dotfiles/bash/include.d/vim                 \
            ${HOME}/etc/dotfiles/bash/include.d/virtualenvwrapper   \
            ${HOME}/.aws_credentials
do
  [[ -f ${file} ]] && source ${file}
done

true
