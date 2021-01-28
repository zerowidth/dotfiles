test -n "$LINUX" || exit 0
type ctags >/dev/null && exit 0
which autoconf >/dev/null || exit 0

test -d /tmp/ctags || git clone https://github.com/universal-ctags/ctags /tmp/ctags

cd /tmp/ctags && \
  ./autogen.sh && \
  ./configure && \
  make && sudo make install