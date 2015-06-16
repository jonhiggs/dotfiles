function credo() {
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

function gitx() {
  gitx_id=$(osascript -e 'id of app "GitX"')
  open -b ${gitx_id} --args $(pwd)
}

# vim: ft=sh
