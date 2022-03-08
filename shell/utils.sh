alias ls='ls -FG'
alias ll='ls -lah'
# alias ll='exa -lah'
alias mv='mv -nv'
alias unlock="security unlock-keychain ~/Library/Keychains/login.keychain"
alias rehash='hash -r'
alias p4="ping 4.2.2.2"
which prettyping >/dev/null && alias ping="prettyping"
alias ia="open -a 'IA Writer' "
alias cz=chezmoi

alias gdiff="git diff --no-index"

alias kcatss="kcat -X security.protocol=ssl -X enable.ssl.certificate.verification=false"

which bat >/dev/null && {
  alias cat="bat"
  export BAT_THEME='base16'
}

test -x ~/kubectl && alias kubectl ~/kubectl
test -x ~/kubectx && alias kubectl ~/kubectl
test -x ~/stern && alias kubectl ~/kubectl

# configure the shell for a kube context and namespace
kc() {
  options() {
    kubectl config get-contexts -o name | parallel 2>/dev/null \
      "kubectl --context {} get ns -o name | sed 's/namespace\///' | xargs -n 1 -Ix echo x {} \({}\)"
  }
  if [ -n "$1" ]; then
    selected=$(options | fzf -q "$1" --nth=1,2 --with-nth=1,3)
  else
    selected=$(options | fzf --nth=1,2 --with-nth=1,3)
  fi
  if [ -z "$selected" ]; then
    return
  fi
  ns=$(echo "$selected" | awk '{print $1}')
  context=$(echo "$selected" | awk '{print $2}')
  kubectx $context
  kubens $ns
}

alias k=kubectl

# run a watch command with kubectl
alias kw='watch kubectl --context $(kubectx -c) --namespace $(kubens -c)'

# run stern with the current namespace
# binary is from https://github.com/wercker/stern
if [ -x ~/stern_linux_amd64 ]; then
  alias stern='./stern_linux_amd64 --namespace $(kubens -c)'
else
  alias stern=$(which stern)' --namespace $(kubens -c)'
  fi

# quickly get to the real path (e.g. go project symlinks)
alias cdr='cd $(pwd -P)'

alias scan-ssh="dns-sd -B _ssh._tcp"

alias awake="pmset -g assertions | grep -i sleep"

# update homebrew
function up() {
  brew update
  brew outdated
  brew upgrade --fetch-HEAD
  brew cu --cleanup --no-brew-update --yes
  brew cleanup
  antigen update
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
      $bundle exec script/server "$@"
    else
      script/server "$@"
    fi
  elif [[ -e bin/rails ]]; then
    $bundle exec rails server "$@"
  else
    echo "no server here"
    return 1
  fi
}
function sc() {
  if [ -x bin/console ]; then
    bin/console
    return
  fi
  local bundle="bundle"
  if [ -x bin/bundle ]; then
    bundle="bin/bundle"
  fi
  if [[ -e script/console ]]; then
    $bundle exec script/console "$@"
  elif [[ -e bin/rails ]]; then
    $bundle exec rails console "$@"
  else
    echo "no console here"
    return 1
  fi
}
alias sb='script/bootstrap'
# alias sv='script/vendor'
alias st='script/test'
alias cst='clear; script/test'

function ssh-setup() {
  ssh $1 'mkdir .ssh; chmod 700 .ssh; touch .ssh/authorized_keys; chmod 600 .ssh/authorized_keys'
  cat ~/.ssh/id_rsa.pub | ssh $1 'cat - >> ~/.ssh/authorized_keys'
}

# p() {
# if [ -n "$1" ]; then
# ps -O ppid -U $USER | grep -i "$1" | grep -v grep
# else
# ps -O ppid -U $USER
# fi
# }

function docker-cleanup() {
  set -x
  docker ps -aq --no-trunc -f status=exited | xargs docker rm
  docker ps -aq --no-trunc -f status=created | xargs docker rm
  docker images -q --filter dangling=true | xargs docker rmi
  docker system prune --volumes -f
  docker volume prune -f
  # https://github.com/docker/for-mac/issues/371
  # docker run --rm -it --privileged --pid=host walkerlee/nsenter -t 1 -m -u -i -n fstrim /var/lib/docker
  # set +x
}

# from https://github.com/junegunn/fzf/wiki/examples
fkill() {
  local pid
  if [ "$UID" != "0" ]; then
    pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
  else
    pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
  fi

  if [ "x$pid" != "x" ]; then
    echo $pid | xargs kill -${1:-9}
  fi
}
