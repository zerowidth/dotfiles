type rbenv &> /dev/null && eval "$(rbenv init -)"

function bo() {
  local bundle="bundle" paths path
  if [ -x bin/bundle ]; then
    bundle="bin/bundle"
  fi
  if ! paths=$($bundle show --paths); then
    echo "$paths"
    return 1
  fi
  if [ $# -gt 0 ]; then
    path=$(echo "$paths" | fzf -d/ --nth=-1 --with-nth=-1 -1 -q "$@")
  else
    path=$(echo "$paths" | fzf -d/ --nth=-1 --with-nth=-1 -1)
  fi
  if [ -n "$path" ]; then
    e "$path"
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
