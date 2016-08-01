case "$(uname)" in
  "Linux")
    alias apt-get='sudo apt-get'
  ;;
  "Darwin")
    alias dnsdomainname='domainname'

    # DARWIN GNU COREUTILS
    if brew list | grep coreutils &> /dev/null; then
      alias cat="gcat"
      alias cp="gcp"
      alias cut="gcut"
      alias date="gdate"
      alias echo="gecho"
      alias gnice="ggnice"
      alias groups="ggroups"
      alias head="ghead"
      alias ln="gln"
      alias ls="gls --color=auto"
      alias mkdir="gmkdir"
      alias mktemp="gmktemp"
      alias readlink="greadlink"
      #alias sed="gsed"
      alias sleep="gsleep"
      alias sort="gsort"
      alias split="gsplit"
      alias stat="gstat"
      alias tail="gtail"
      alias tee="gtee"
      alias touch="gtouch"
      alias uname="guname"
      alias uniq="guniq"
      alias uptime="guptime"
    fi
    alias umount="diskutil umount"
  ;;
esac

source ${HOME}/etc/dotfiles/bash/aliases.d/common

# vim: ft=sh:ts=2:sw=2
