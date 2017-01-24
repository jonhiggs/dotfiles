# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
[[ -z "${PS1}" ]] && return

PATH="${HOME}/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export TZ="Australia/Melbourne"

# SOURCE EXTRAS
for file in                                               \
  ${HOME}/etc/dotfiles/bash/include.d/aliases.inc         \
  ${HOME}/etc/dotfiles/bash/include.d/arduino             \
  ${HOME}/etc/dotfiles/bash/include.d/aws                 \
  ${HOME}/etc/dotfiles/bash/include.d/bash-my-aws         \
  ${HOME}/etc/dotfiles/bash/include.d/bash_completion     \
  ${HOME}/etc/dotfiles/bash/include.d/bash_environment    \
  ${HOME}/etc/dotfiles/bash/include.d/df                  \
  ${HOME}/etc/dotfiles/bash/include.d/functions.inc       \
  ${HOME}/etc/dotfiles/bash/include.d/ghost               \
  ${HOME}/etc/dotfiles/bash/include.d/git                 \
  ${HOME}/etc/dotfiles/bash/include.d/golang              \
  ${HOME}/etc/dotfiles/bash/include.d/grep                \
  ${HOME}/etc/dotfiles/bash/include.d/history             \
  ${HOME}/etc/dotfiles/bash/include.d/homebrew            \
  ${HOME}/etc/dotfiles/bash/include.d/java                \
  ${HOME}/etc/dotfiles/bash/include.d/less                \
  ${HOME}/etc/dotfiles/bash/include.d/locale              \
  ${HOME}/etc/dotfiles/bash/include.d/ls                  \
  ${HOME}/etc/dotfiles/bash/include.d/n                   \
  ${HOME}/etc/dotfiles/bash/include.d/ps1                 \
  ${HOME}/etc/dotfiles/bash/include.d/rea-as              \
  ${HOME}/etc/dotfiles/bash/include.d/rvm                 \
  ${HOME}/etc/dotfiles/bash/include.d/ssh                 \
  ${HOME}/etc/dotfiles/bash/include.d/tmux                \
  ${HOME}/etc/dotfiles/bash/include.d/vim                 \
  ${HOME}/etc/dotfiles/bash/include.d/virtualenvwrapper   \
  ${HOME}/etc/dotfiles/bash/include.d/xdg
do
  [[ -f ${file} ]] && source ${file}
done

true
