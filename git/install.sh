git config --global --replace-all include.path ~/.dotfiles/git/gitconfig

if [ -n "$(command -v code)" ]; then
  git config --global core.editor "code --wait"
fi

if [ -z "$LINUX" ]; then
  git config --global credential.helper osxkeychain
fi

git config --global --replace-all include.path ~/.dotfiles/git/gitconfig
