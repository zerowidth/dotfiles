export EDITOR="vim"

function d() {
  local dir="."
  if [ -n "$1" ]; then
    if [ -d "$1" ]; then
      dir=${1%/} # strip trailing slash so vim stays happy
      shift
    else
      echo "$1 is not a directory?"
      return 1
    fi
  fi
  pushd "$dir" >/dev/null || return 1
  mvim +Refresh "$dir" "$@"
  popd >/dev/null || return 1
}

function e() {
  if [ -n "$1" ]; then
    local file dir
    file=$(basename "$1")
    dir=$(dirname "$1")
    shift
    pushd "$dir" >/dev/null || return 1
    mvim "$file" "$@"
    popd >/dev/null || return 1
  else
    mvim "$@"
  fi
}
