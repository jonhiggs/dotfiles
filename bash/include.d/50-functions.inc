function append_to_path() {
  [[ -d $1 ]] && export PATH="$PATH:$1"
}

function prepend_to_path() {
  [[ -d $1 ]] && export PATH="$1:$PATH"
}

function groot() {
  cd $(driller --scm-root ./)
}

function dockerenv() {
  local status="$(docker-machine status ${DOCKER_MACHINE_NAME})"
  [[ "${status}" != "Running" ]] \
    && docker-machine start ${DOCKER_MACHINE_NAME}
  eval $(docker-machine env ${DOCKER_MACHINE_NAME} 2> /dev/null || exit 1)
}

# vim: ft=sh
