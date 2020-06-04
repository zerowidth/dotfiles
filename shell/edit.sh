export EDITOR="vim"

[ -n "$LINUX" ] && return

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
