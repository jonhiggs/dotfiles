function append_to_path() {
  if [ -d $1 ]; then export PATH=$PATH:$1; fi
}

function prepend_to_path() {
  if [ -d $1 ]; then export PATH=$1:$PATH; fi
}

function credo() {
  addr="169.254.169.254"
  loopback_interface="lo0"
  routed_interface="$(route get $addr | grep interface | awk '{ print $2 }')"
  if [[ "$routed_interface" != "$loopback_interface" ]]; then
    echo "creating $addr alias"
    sudo ifconfig lo0 alias $addr
    for action in unload load; do
      sudo launchctl $action /Library/LaunchDaemons/delfick.credo.fake_metadata.plist
    done
  fi

  if ~/projects/credo/bin/credo sourceable $@; then
    output=$(~/projects/credo/bin/credo $@)
    if (($? == 0)); then
      echo "$output" > /tmp/lolz
      source /tmp/lolz
    else
      echo "$output"
    fi
  else
    ~/projects/credo/bin/credo $@
  fi
}

function switch() {
  credo --account $1 switch
}

function gitx() {
  dir=${1:-$(pwd)}
  gitx_id=$(osascript -e 'id of app "GitX"')
  open -b ${gitx_id} --args $(driller --absolute ${dir})
}

# vim: ft=sh
