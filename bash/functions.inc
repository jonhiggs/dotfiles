function append_to_path() {
  if [ -d $1 ]; then export PATH=$PATH:$1; fi
}

function prepend_to_path() {
  if [ -d $1 ]; then export PATH=$1:$PATH; fi
}

function groot() {
  cd $(driller --scm-root ./)
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
  bin="/usr/bin/ghost"
  case $1 in
    "list"|"")  ${bin} $@      ;;
    *)          sudo ${bin} $@ ;;
  esac
}

function disconnector() {
  osascript -e 'quit app "iTunes"'
  for dir in /Volumes/iTunes; do
    while [[ -d "${dir}" ]]; do
      umount "${dir}"
      sleep 1
    done
  done
}

function dockerenv() {
  status="$(docker-machine status ${DOCKER_MACHINE_NAME})"
  [[ "${status}" == "Stopped" ]] && docker-machine start ${DOCKER_MACHINE_NAME}
  eval $(docker-machine env ${DOCKER_MACHINE_NAME} 2> /dev/null || return 1)
}

# vim: ft=sh
