[ -z "$LINUX" ] && return
curl -sLo /tmp/git-delta.deb https://github.com/dandavison/delta/releases/download/0.1.1/git-delta_0.1.1_amd64.deb &&
  sudo dpkg -i /tmp/git-delta.deb

[ -d /usr/share/doc/git/contrib/diff-highlight ] && {
  cd /usr/share/doc/git/contrib/diff-highlight && sudo make
}