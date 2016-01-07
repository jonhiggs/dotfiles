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

export IDP_USER="jon.higgs"
export IDP_HOST="idp.realestate.com.au"
function switch() {
  case $1 in
    "devprod")  AWS_DEFAULT_ROLE="Muppets-Admin"          ;;
    "rca-dev")  AWS_DEFAULT_ROLE="RCA-Dev-Administrator"  ;;
    "rca-prod") AWS_DEFAULT_ROLE="RCA-Prod-Administrator" ;;
    "rca-stg")  AWS_DEFAULT_ROLE="RCA-Stg-Administrator"  ;;
  esac

  source ~/Repos/saml-aws-functions/bash-functions
  authenticate > /dev/null || return 1
  unset AWS_DEFAULT_ROLE
  env | grep ^AWS_ | sed 's/^/export /' > ~/.aws_credentials
  chmod 600 ~/.aws_credentials
  chown ${USER} ~/.aws_credentials
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
