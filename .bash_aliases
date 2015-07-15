OS=`uname`

# STANDARD ALIASES
alias cdd='cd ../; ls'
alias df='df -H'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias l='ls -lAFh'
alias la='ls -A'
alias ll='ls -alF'
alias ls='ls -G'

# OS SPECIFIC
case ${OS} in
  "Linux")
    if [ -x /usr/bin/dircolors ]; then
      test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
      alias ls='ls --color=auto'
    fi

    alias apt-get='sudo apt-get'
  ;;
  "Darwin")
    export GREP_COLOR="1;37;41"
    export LANG=C
    alias dnsdomainname='domainname'

    # DARWIN GNU COREUTILS
    if [ `brew list | grep coreutils &> /dev/null; echo $?` -eq 0 ]; then
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
      alias readlink="greadlink"
    fi
  ;;
esac

export EDITOR='/usr/local/bin/vim'
# MY ALIASES
alias vi='vim'
alias pwgen="pwgen -s 14 1"
alias tig="tig status"
alias cs="switch"
alias ghost="sudo ghost"

# vim: syntax=sh:ts=2:sw=2
