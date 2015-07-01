[[ -s ~/.bashrc ]] && source ~/.bashrc

### RVM #######################################################################
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

### VIRTUALENVWRAPPER #########################################################
export WORKON_HOME="$HOME/VirtualEnvs"
[[ -d ${WORKON_HOME} ]] || mkdir ${WORKON_HOME}
source /usr/local/bin/virtualenvwrapper.sh
