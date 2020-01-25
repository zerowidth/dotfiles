export EDITOR="vim"

function e() {
  if [ -n "$1" ]; then
    if [ -d "$1" ]; then
      local dir
      dir=${1%/} # strip trailing slash so vim stays happy
      shift

      pushd "$dir" >/dev/null || return 1
      mvim +Refresh "$dir" "$@"
      popd >/dev/null || return 1
    else
      local file dir
      file=$(basename "$1")
      dir=$(dirname "$1")
      shift
      pushd "$dir" >/dev/null || return 1
      mvim "$file" "$@"
      popd >/dev/null || return 1
    fi
  else
    mvim "$@"
  fi
}

alias ij=idea
