function append_to_path() {
  if [ -d $1 ]; then export PATH=$PATH:$1; fi
}

function prepend_to_path() {
  if [ -d $1 ]; then export PATH=$1:$PATH; fi
}

function credo() {
  addr="169.254.169.254"
  loopback_interface="lo0"
  if ! ifconfig ${loopback_interface} | grep ${addr} > /dev/null; then
    echo "creating $addr alias"
    sudo ifconfig lo0 alias $addr
    plist=/Library/LaunchDaemons/delfick.credo.fake_metadata.plist
    for action in unload load; do
      sudo launchctl $action $plist
    done
  fi

  if ~/VirtualEnvs/credo/bin/credo sourceable $@; then
    output=$(~/VirtualEnvs/credo/bin/credo $@)
    if (($? == 0)); then
      echo "$output" > /tmp/lolz
      source /tmp/lolz
    else
      echo "$output"
    fi
  else
    ~/VirtualEnvs/credo/bin/credo $@
  fi
}

function switch() {
  unset AWS_ACCESS_KEY_ID
  unset AWS_SECRET_ACCESS_KEY
  unset AWS_SECURITY_TOKE
  unset AWS_SESSION_TOKEN

  if [[ -z $1 ]]; then
    credo show
  else
    credo --account $1 switch
  fi
}

function gitx() {
  dir=${1:-$(pwd)}
  gitx_id=$(osascript -e 'id of app "GitX"')
  open -b ${gitx_id} --args $(driller --absolute ${dir})
}

function marked() {
  open -b $(osascript -e 'id of app "Marked 2"') $@
}

function nvim() {
  if ps -o command | grep ^/usr/local/bin/nvim &> /dev/null; then
    local running="true"
  else
    local running="false"
  fi

  if ! ${running} && [[ -S ${NVIM_LISTEN_ADDRESS} ]]; then
    # clean up lingering socket
    rm ${NVIM_LISTEN_ADDRESS}
  fi

  if ${running} && [[ -S ${NVIM_LISTEN_ADDRESS} ]]; then
    ~/etc/vimfiles/nvim-tabedit.py $@
  else
    /usr/local/bin/nvim -p $@
  fi
}

# vim: ft=sh
