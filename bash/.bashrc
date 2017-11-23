# ~/.bashrc: executed by bash(1) for non-login shells.
[[ ${BASH_VERSION} =~ ^4 ]] || echo "You are not running bash 4."

# If not running interactively, don't do anything
[[ -z "${PS1}" ]] && return

PATH="${HOME}/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export TZ="Australia/Melbourne"

# SOURCE EXTRAS
for file in ${HOME}/etc/dotfiles/bash/include.d/*; do
  [[ ${file} =~ .disabled$ ]] && continue
  [[ -f ${file} ]] && source ${file}
done

true
