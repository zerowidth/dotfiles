alias ls='ls -FG'
alias ll='ls -lah'
alias mv='mv -nv'
alias unlock="security unlock-keychain ~/Library/Keychains/login.keychain"
alias rehash='hash -r'
alias p4="ping 4.2.2.2"
alias ia="open -a 'IA Writer' "

# quickly get to the real path (e.g. go project symlinks)
alias cdr='cd $(pwd -P)'

alias scan-ssh="dns-sd -B _ssh._tcp"

# because macos forgets how to use cameras sometimes
alias kill-camera="sudo killall VDCAssistant"

# update everything
function up() {
  set -e
  echo '--- brew ---'
  brew update
  brew outdated
  brew upgrade
  brew cu --cleanup --no-brew-update --yes
  brew cleanup
  echo '--- vim ---'
  pushd ~/.vim >/dev/null
  rake
  popd >/dev/null
}

# Run a command, copying the command line first and then capturing the output.
# This is in support of the alfred github details snippet
function details() {
  if [ $# = 0 ]; then
    echo -n "details <command> captures the command and its output "
    echo "for the 'details' alfred snippet"
    return
  fi
  echo "capturing output of ${*}..."
  echo "\$ $*" | pbcopy
  sleep 1 # let alfred pick it up
  "$@" | pbcopy
  echo "done."
}

function ss() {
  local bundle="bundle"
  if [ -x bin/bundle ]; then
    bundle="bin/bundle"
  fi
  if [[ -e script/server ]]; then
    if [[ -e Gemfile ]]; then
      $bundle exec script/server
    else
      script/server
    fi
  elif [[ -e bin/rails ]]; then
    $bundle exec rails server
  else
    echo "no server here"
    return 1
  fi
}
function sc() {
  local bundle="bundle"
  if [ -x bin/bundle ]; then
    bundle="bin/bundle"
  fi
  if [[ -e script/console ]]; then
    $bundle exec script/console
  elif [[ -e bin/rails ]]; then
    $bundle exec rails console
  else
    echo "no console here"
    return 1
  fi
}
alias sb='script/bootstrap --local'
alias sv='script/vendor'
alias st='script/test'
alias cst='clear; script/test'

function ssh-setup {
  ssh $1 'mkdir .ssh; chmod 700 .ssh; touch .ssh/authorized_keys; chmod 600 .ssh/authorized_keys'
  cat ~/.ssh/id_rsa.pub | ssh $1 'cat - >> ~/.ssh/authorized_keys'
}

p() {
  if [ -n "$1" ]; then
    ps -O ppid -U $USER | grep -i "$1" | grep -v grep
  else
    ps -O ppid -U $USER
  fi
}
