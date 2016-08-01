function append_to_path() {
  [[ -d $1 ]] && export PATH="$PATH:$1"
}

function prepend_to_path() {
  [[ -d $1 ]] && export PATH="$1:$PATH"
}

function groot() {
  cd $(driller --scm-root ./)
}

# vim: ft=sh
