if test -z "$ZSH_VERSION"; then
  [ -f ~/.fzf.bash ] && source ~/.fzf.bash
else
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fi
