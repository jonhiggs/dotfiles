# ~/.bashrc: executed by bash(1) for non-login shells.
[[ ${BASH_VERSION} =~ ^5 ]] || echo "You are not running bash 5."

# If not running interactively, don't do anything
[[ -z "${PS1}" ]] && return

PATH="${HOME}/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export TZ="Australia/Melbourne"

# SOURCE EXTRAS
for file in ${HOME}/etc/dotfiles/bash/include.d/*; do
  [[ ! -f ${file} ]]            && continue
  [[ ${file} =~ .disabled$ ]]   && continue
  [[ ${file} =~ .example$ ]]    && continue

  if ${TIME_BASH:-false}; then
    echo "sourcing ${file}"
    time source "${file}"
  else
    source "${file}"
  fi

done

true
