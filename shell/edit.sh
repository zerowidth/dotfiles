#!/usr/local/bin/bash

if which code >/dev/null; then
    export EDITOR="code"
elif which vim >/dev/null; then
    export EDITOR="vim"
elif which vi >/dev/null; then
    export EDITOR="vi"
fi

type code >/dev/null || return

function e() {
  if [ -n "$1" ]; then
    if [ -d "$1" ]; then
      # local dir
      # dir=${1%/} # strip trailing slash so vim stays happy
      # $SHELL -l -c "cd \"$dir\" && mvim +Refresh ."
      code -n $1
    else
      # local file dir
      # file=$(basename "$1")
      # dir=$(dirname "$1")
      # $SHELL -l -c "cd \"$dir\" && mvim +Refresh \"$file\""
      code -n $1
    fi
  else
    # mvim "$@"
    code -n . "$@"
  fi
}
