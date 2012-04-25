OS=`uname`

# STANDARD ALIASES
if [ ${OS} == "Darwin" ]; then alias ls='ls -G'; fi
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
