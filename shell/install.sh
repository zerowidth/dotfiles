#!/usr/bin/env sh

echo "fetching iterm2 shell integration scripts"
curl -s -L https://iterm2.com/shell_integration/bash -o shell/iterm2_shell_integration.bash
curl -s -L https://iterm2.com/shell_integration/zsh -o shell/iterm2_shell_integration.zsh

if [ -n "$LINUX" ]; then
  if ! test -f ~/.dotfiles/antigen.zsh; then
    curl -L git.io/antigen > ~/.dotfiles/antigen.zsh
  fi

  if ! type bat >/dev/null; then
    curl -s -L https://github.com/sharkdp/bat/releases/download/v0.18.1/bat_0.18.1.amd64.deb -o /tmp/bat.deb && \
      sudo dpkg -i /tmp/bat.deb
  fi

  sudo apt-get install -y fswatch || true
  sudo apt-get install -y zsh zsh-syntax-highlighting
fi
