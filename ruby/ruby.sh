type rbenv &> /dev/null && eval "$(rbenv init -)"

function bo() {
  local bundle="bundle" gems gem
  if [ -x bin/bundle ]; then
    bundle="bin/bundle"
  fi
  if ! gems=$($bundle list --paths); then
    echo "$gems"
    return 1
  fi
  if [ $# -gt 0 ]; then
    gem=$(echo "$gems" | fzf -d/ --nth=-1 --with-nth=-1 -1 -q "$@")
  else
    gem=$(echo "$gems" | fzf -d/ --nth=-1 --with-nth=-1 -1)
  fi
  if [ -n "$gem" ]; then
    e "$gem"
  else
    return 1
  fi
}

function be() {
  local bundle="bundle"
  if [ -x bin/bundle ]; then
    bundle="bin/bundle"
  fi
  $bundle exec "$@"
}
