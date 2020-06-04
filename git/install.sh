if [ -z "$LINUX" ]; then
  git config --global --replace-all include.path ~/.dotfiles/git/gitconfig
  return
fi

git config --global --replace-all include.path ~/.dotfiles/git/gitconfig
git config --global --add include.path ~/.dotfiles/git/gitconfig.nohttps

curl -sLo /tmp/git-delta.deb https://github.com/dandavison/delta/releases/download/0.1.1/git-delta_0.1.1_amd64.deb &&
  sudo dpkg -i /tmp/git-delta.deb

[ -d /usr/share/doc/git/contrib/diff-highlight ] && {
  cd /usr/share/doc/git/contrib/diff-highlight && sudo make
}