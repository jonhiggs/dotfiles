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
alias l='ls -lAF'

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
export EDITOR='vim'
alias vi='vim'
case ${OS} in
  "Linux")
    if [ ! -z $DISPLAY ]; then
      alias vim='vim --servername SCREEN --remote-tab'
    fi
  ;;
  "Darwin")
    type=mvim
    if [ $type == "vico" ]; then
      alias vim='/Applications/Vico.app/Contents/MacOS/vicotool'
    else
      alias vim='mvim --remote-tab'
      export EDITOR='mvim -f'
    fi

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
fi

alias gmt='git mergetool -t opendiff'
alias gpl='git pull'
alias gpom='git push origin master'
alias gpu='git push'
alias grb='git rebase'
alias gs='git stash'
alias gsp='git stash pop'
alias gst='git status'
alias gco='git checkout'

# KNIFE
helpers="~/Repos/chef/bin/helpers"
alias kb="$helpers/cookbook_bump"
alias ku="$helpers/cookbook_upload"
alias kf="$helpers/cookbook_freeze"
alias kfa="$helpers/cookbook_freeze_all"

# MUSIC_MANAGEMENT
music_management_dir='/Users/jon/Repos/music_management'
alias dir2mp3="$music_management_dir/dir2mp3"
alias sync_music="$music_management_dir/sync_music"

# MY ALIASES
alias ussh="ssh -i ~/.ssh/ubuntu"
alias ssh-no-bastion="ssh -o ProxyCommand=none"

alias aws-environment="echo \$EC2_CERT | grep -o 'aws-[a-z]*' | sed 's/aws-//'"
alias aws-production="source ~/Repos/aws-production/etc/environment"
alias aws-testing="source ~/Repos/aws-testing/etc/environment"

alias ack="echo 'Oi! Use ag now... It is faster'"

alias 1pass="/usr/local/share/npm/lib/node_modules/1pass/bin/1pass"
alias pwgen="pwgen -s 14 1"
alias marked="/Applications/Marked.app/Contents/Resources/mark"

# a hack to find python at the wrong place. (https://github.com/mxcl/homebrew/issues/22534)
alias hg="/usr/local/share/python/hg"

# vim: syntax=sh:ts=2:sw=2
