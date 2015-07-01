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

function marked() {
  open -b $(osascript -e 'id of app "Marked 2"') $@
}

function vim() {
  v="/usr/local/bin/vim"
  servername="SCREEN"
  running=$($v --serverlist | grep "^${servername}$" > /dev/null && echo true || echo false)

  if [[ ! -z $1 ]]; then
    if $running; then
      file="--remote-tab $1"
    else
      file="$1"
    fi
  else
    file=""
  fi

  $v --servername ${servername} ${file}
}

# vim: ft=sh
