test -n "$LINUX" || return
type ctags >/dev/null && return
test -d /tmp/ctags || git clone https://github.com/universal-ctags/ctags /tmp/ctags

cd /tmp/ctags && \
  ./autogen.sh && \
  ./configure && \
  make && sudo make install