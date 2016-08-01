function append_to_path() {
  if [ -d $1 ]; then export PATH=$PATH:$1; fi
}

function prepend_to_path() {
  if [ -d $1 ]; then export PATH=$1:$PATH; fi
}

function groot() {
  cd $(driller --scm-root ./)
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

# vim: ft=sh
