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
  #unset AWS_ACCESS_KEY_ID
  #unset AWS_SECRET_ACCESS_KEY
  #unset AWS_SECURITY_TOKEN
  #unset AWS_SESSION_TOKEN
  #if [[ -z $1 ]]; then
  #  echo ${SWITCHED_TO}
  #else
  #  credo --account $1 switch > /dev/null &&
  #    export SWITCHED_TO=$1               &&
  #    return 0

  #  return 1
  #fi

  local user="jon.higgs"
  local host="idp.realestate.com.au"

  case $1 in
    "rca-dev")  local role="RCA-Dev-Administrator"  ;;
    "rca-stg")  local role="RCA-Stg-Administrator"  ;;
    "rca-prod") local role="RCA-Prod-Administrator" ;;
    "devprod")  local role="Shared-Prod-NormalUser" ;;
  esac

  source ~/Repos/saml-aws-functions/bash-functions
  authenticate -u ${user} -h ${host} -r ${role} > /dev/null || return 1
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
  if ~/etc/vimfiles/nvim-socket_used ${NVIM_LISTEN_ADDRESS}; then
    ~/etc/vimfiles/nvim-tabedit.py $@
  else
    rm -f ${NVIM_LISTEN_ADDRESS} # clean up lingering socket
    /usr/local/bin/nvim -p $@
  fi
}

# vim: ft=sh
