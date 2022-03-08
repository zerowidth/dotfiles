if [[ -d /usr/local/sbin ]]; then
  export PATH=${PATH}:/usr/local/sbin
fi

if [[ -d /opt/homebrew/sbin ]]; then
  export PATH=${PATH}:/opt/homebrew/sbin
fi

export PATH=$HOME/.dotfiles/bin:$PATH
