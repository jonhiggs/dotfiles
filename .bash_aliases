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
  ;;
esac

# GIT
if [ ${OS} == "Linux" ]; then alias gg='gitg'; fi
if [ ${OS} == "Darwin" ]; then
  alias gx='gitx &'
fi
alias gpom='git push origin master'
alias gpu='git push'
alias gpl='git pull'
alias gmt='git mergetool -t opendiff'

# MY ALIASES
alias ussh="ssh -i ~/.ssh/ubuntu"

alias aws-environment="echo \$EC2_CERT | grep -o 'aws-[a-z]*' | sed 's/aws-//'"
alias aws-production="source ~/Repos/aws-production/etc/environment"
alias aws-testing="source ~/Repos/aws-testing/etc/environment"
