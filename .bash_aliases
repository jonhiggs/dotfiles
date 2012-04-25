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

# VIM
alias vi='vim'
case ${OS} in
  "Linux")  alias vim='vim --servername SCREEN --remote-tab' ;;
  "Darwin") alias vim='mvim --remote-tab' ;;
esac

# GIT
if [ ${OS} == "Linux" ]; then alias gg='gitg'; fi
if [ ${OS} == "Darwin" ]; then alias gx='/Applications/GitX.app/Contents/MacOS/GitX ./'; fi
alias gpom='git push origin master'
alias gpu='git push'
alias gpl='git pull'

# MISC
alias ack='ack-grep'

# APT
alias apt-get='sudo apt-get'
