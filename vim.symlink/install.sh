echo "Configuring vim"
mkdir -p ~/.vimundo
mkdir -p ~/.vimswap

if [ -d ~/.vim/plugins ]; then
  echo "vim plugins already installed, skipping"
 else
  vim --not-a-term +PlugInstall +qa
fi