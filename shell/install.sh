#!/usr/bin/env sh

echo "fetching iterm2 shell integration scripts"
curl -s -L https://iterm2.com/shell_integration/bash -o shell/iterm2_shell_integration.bash
curl -s -L https://iterm2.com/shell_integration/zsh -o shell/iterm2_shell_integration.zsh

if [ -n "$LINUX" ]; then
  if type zsh >/dev/null; then
    echo "zsh already installed, skipping"
  else
    sudo apt-get install -y zsh
  fi

  sudo chsh --shell /bin/zsh `whoami`

  if type bat >/dev/null; then
    echo "bat already installed, skipping"
  else
    curl -s -L https://github.com/sharkdp/bat/releases/download/v0.15.4/bat_0.15.4_amd64.deb -o /tmp/bat.deb && \
      sudo dpkg -i /tmp/bat.deb
  fi

fi
