OS=`uname`

# OS SPECIFIC
case ${OS} in
  "Linux")
    alias apt-get='sudo apt-get'
  ;;
  "Darwin")
    export LANG=C
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

# MY ALIASES
alias cdd='cd ../; ls'
alias df='df -H'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias l='ls -lAFh'
alias la='ls -A'
alias ll='ls -alF'
alias lock='pmset displaysleepnow'
alias ls='ls -G'
alias pwgen="pwgen -s 14 1"
alias sdate='gdate --rfc-3339=date'
alias tig="tig status"
alias switch='rea-as-switch'
alias unswitch='rea-as-unswitch'
alias vi='nvim'
alias vim='nvim'

# BMA ALIASES
alias stack='stacks'
alias instance="instances"

# vim: syntax=sh:ts=2:sw=2
