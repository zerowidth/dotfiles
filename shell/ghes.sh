[ -z "$LINUX" ] && return

if [ -d /workspace/enterprise2 ]; then
  cd /workspace/enterprise2 || return
fi