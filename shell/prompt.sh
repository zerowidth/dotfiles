test -z "$ZSH_VERSION" ||  return # bash-only

debug_colors() {
  echo -e \
    "${TEXT_FOREGROUND}foreground" \
    "${TEXT_BLACK}black" \
    "${TEXT_RED}red" \
    "${TEXT_GREEN}green" \
    "${TEXT_YELLOW}yellow" \
    "${TEXT_BLUE}blue" \
    "${TEXT_MAGENTA}magenta" \
    "${TEXT_CYAN}cyan" \
    "${TEXT_LIGHTGRAY}lgray" \
    "${TEXT_DARKGRAY}dkgray" \
    "${TEXT_LIGHTRED}lred" \
    "${TEXT_LIGHTGREEN}lgreen" \
    "${TEXT_LIGHTYELLOW}lyellow" \
    "${TEXT_LIGHTBLUE}lblue" \
    "${TEXT_LIGHTMAGENTA}lmagenta" \
    "${TEXT_LIGHTCYAN}lcyan" \
    "${TEXT_WHITE}white" \
    $TEXT_RESET
}

function pre_prompt(){
    history -a
    echo -ne "\033]1;${PWD/${HOME@E}/\~}\007" # tab
    echo -ne "\033]2;${USER}@${HOSTNAME%%.*}:${PWD/${HOME@E}/\~}\007" # window
}
starship_precmd_user_func="pre_prompt"

type starship &> /dev/null && {
  eval "$(starship init bash)"
}

# after all the prompt stuff is set up, install iterm integration
. "$HOME/.dotfiles/shell/iterm2_shell_integration.bash"
