#!/usr/bin/env sh

echo "fetching iterm2 shell integration scripts"
curl -s -L https://iterm2.com/shell_integration/bash -o shell/iterm2_shell_integration.bash
curl -s -L https://iterm2.com/shell_integration/zsh -o shell/iterm2_shell_integration.zsh
