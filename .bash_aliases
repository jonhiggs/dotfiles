OS=`uname`

# OS SPECIFIC
case ${OS} in
  "Linux")
    if [ -x /usr/bin/dircolors ]; then
      test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
      alias ls='ls --color=auto'
      # http://geoff.greer.fm/lscolors/
      export LS_COLORS="di=34;40:ln=36;40:so=31;40:pi=33;40:ex=32;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:"
    fi

    alias apt-get='sudo apt-get'
  ;;
  "Darwin")
    export GREP_COLOR="1;37;41"
    export LSCOLORS="exgxbxdxcxegedabagacad"
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
      alias umount="diskutil umount"
      alias uname="guname"
      alias uniq="guniq"
      alias uptime="guptime"
    fi
  ;;
esac

# MY ALIASES
alias cdd='cd ../; ls'
alias df='df -H'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias ghost="sudo ghost"
alias grep='grep --color=auto'
alias l='ls -lAFh'
alias la='ls -A'
alias ll='ls -alF'
alias lock='pmset displaysleepnow'
alias ls='ls -G'
alias pwgen="pwgen -s 14 1"
alias sdate='gdate --rfc-3339=date'
alias tig="tig status"
alias vi='nvim'
alias vim='nvim'

# BMA ALIASES
alias stack='stacks'
alias instance="instances"

# vim: syntax=sh:ts=2:sw=2
