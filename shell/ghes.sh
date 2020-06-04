[ -z "$LINUX" ] && return

if [ -d /workspace/enterprise2 ]; then
  export OVERLAY_VM_FILES=yes
  export ENABLE_HYDRO=1
  cd /workspace/enterprise2 || return
fi