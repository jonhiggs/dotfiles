function append_to_path() {
  if [ -d $1 ]; then export PATH=$PATH:$1; fi
}

function prepend_to_path() {
  if [ -d $1 ]; then export PATH=$1:$PATH; fi
}

function gitx() {
  dir=${1:-$(pwd)}
  gitx_id=$(osascript -e 'id of app "GitX"')
  open -b ${gitx_id} --args $(driller --absolute ${dir})
}

function groot() {
  cd $(driller --scm-root ./)
}

function marked() {
  open -b $(osascript -e 'id of app "Marked 2"') $@
}

function nvim() {
  if ~/etc/vimfiles/nvim-socket_used ${NVIM_LISTEN_ADDRESS}; then
    ~/etc/vimfiles/nvim-tabedit.py $@
  else
    rm -f ${NVIM_LISTEN_ADDRESS} # clean up lingering socket
    /usr/local/bin/nvim -p $@
  fi
}

function ghost() {
  bin="/Users/jon.higgs/.rvm/gems/ruby-2.2.2/bin/ghost"
  case $1 in
    "list") ${bin} $@      ;;
    *)      sudo ${bin} $@ ;;
  esac
}

function dockerenv() {
  eval $(docker-machine env ${DOCKER_MACHINE_NAME} 2> /dev/null || return 1)
}

function bash_environment() {
  local env_file="${HOME}/.bash_environment"
  local k=$(echo "$1" | cut -d= -f1)
  local v=$(echo "$1" | cut -d= -f2)

  [[ -f "${env_file}" ]] || touch "${env_file}"

  if [[ $# -eq 1 ]]; then
    if grep -E "^$k=" "${env_file}" &> /dev/null; then
      # replace
      sed -i -e "s/$k=.*/$1/" "${env_file}"
    else
      # append
      echo $1 >> "${env_file}"
    fi
  fi

  # cleanup
  data="$(
    cat "${env_file}" \
      | grep -v "^# vim:" \
      | grep -v ^$ \
      | sort \
      | uniq
  )"
  echo "${data}" > .bash_environment
  echo "# vim: ft=sh" >> .bash_environment
  source "${env_file}"
}

# vim: ft=sh
