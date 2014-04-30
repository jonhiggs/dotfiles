OS=`uname`

# CONFIGURE COLOR SUPPORT
case ${OS} in
  "Linux")
    if [ -x /usr/bin/dircolors ]; then
      test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
      alias ls='ls --color=auto'
    fi
  ;;
  "Darwin")
    export GREP_COLOR="1;37;41"
    export LANG=C
    alias ls='ls -G'
    alias dnsdomainname='domainname'
  ;;
esac

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# STANDARD ALIASES
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -lAFh'
alias cdd='cd ../; ls'

# OS SPECIFIC
case ${OS} in
  "Linux")
    alias apt-get='sudo apt-get'
    alias ack='ack-grep'
  ;;
  "Darwin")
    alias df='df -H'
    alias tn='~/Repos/dotfiles/bin/tn'
  ;;
esac

# VIM
case ${OS} in
  "Linux")
    if [ ! -z $DISPLAY ]; then
      alias vim='vim --servername SCREEN --remote-tab'
    fi
  ;;
  "Darwin")
    export EDITOR='/usr/local/bin/vim'
    type="vim"
    case ${type} in
      "vico")
        alias vim='/Applications/Vico.app/Contents/MacOS/vicotool'
      ;;
      "macvim")
        alias vim='mvim --remote-tab'
        export EDITOR='mvim -f'
      ;;
      "vim")
        alias vim='/usr/local/bin/vim --servername SHARED --remote-tab'
        export EDITOR='/usr/local/bin/vim --remote-tab'
      ;;
    esac
    alias vi='vim'

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
      alias sed="gsed"
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

# GIT
if [ ${OS} == "Linux" ]; then alias gg='gitg'; fi
if [ ${OS} == "Darwin" ]; then
  alias gitx="/Applications/GitX.app/Contents/Resources/gitx"
  alias gx='gitx'
  alias st='stree'
fi

alias esb="ec2-ssh $(ec2-instances-by-security-group bootstrapping)"

# KNIFE
helpers="~/Repos/chef/bin/helpers"
alias kb="$helpers/cookbook_bump"
alias ku="$helpers/cookbook_upload"
alias kf="$helpers/cookbook_freeze"
alias kfa="$helpers/cookbook_freeze_all"

# MY ALIASES
alias 1pass="/usr/local/share/npm/lib/node_modules/1pass/bin/1pass"
alias ack="echo 'Oi! Use ag now... It is faster'"
alias marked="/Applications/Marked.app/Contents/Resources/mark"
alias pocket="${HOME}/Repos/pocket-cli/pocket-cli.py"
alias pwgen="pwgen -s 14 1"
alias ussh="ssh -i ~/.ssh/ubuntu"

# vim: syntax=sh:ts=2:sw=2
