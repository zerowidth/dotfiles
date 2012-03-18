[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

. ~/.secrets # api keys etc

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
