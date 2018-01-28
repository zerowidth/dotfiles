# fancy prompt stuff

# http://misc.flogisoft.com/bash/tip_colors_and_formatting#bash_tipscolors_and_formatting_ansivt100_control_sequences
TEXT_FOREGROUND='\e[39m'
TEXT_BLACK='\e[30m'
TEXT_RED='\e[31m'
TEXT_GREEN='\e[32m'
TEXT_YELLOW='\e[33m'
TEXT_BLUE='\e[34m'
TEXT_MAGENTA='\e[35m'
TEXT_CYAN='\e[36m'
TEXT_LIGHTGRAY='\e[37m'
TEXT_DARKGRAY='\e[90m'
TEXT_LIGHTRED='\e[91m'
TEXT_LIGHTGREEN='\e[92m'
TEXT_LIGHTYELLOW='\e[93m'
TEXT_LIGHTBLUE='\e[94m'
TEXT_LIGHTMAGENTA='\e[95m'
TEXT_LIGHTCYAN='\e[96m'
TEXT_WHITE='\e[97m'

BG_BACKGROUND='\e[49m'
BG_BLACK='\e[40m'
BG_RED='\e[41m'
BG_GREEN='\e[42m'
BG_YELLOW='\e[43m'
BG_BLUE='\e[44m'
BG_MAGENTA='\e[45m'
BG_CYAN='\e[46m'
BG_LIGHTGRAY='\e[47m'
BG_DARKGRAY='\e[100m'
BG_LIGHTRED='\e[101m'
BG_LIGHTGREEN='\e[102m'
BG_LIGHTYELLOW='\e[103m'
BG_LIGHTBLUE='\e[104m'
BG_LIGHTMAGENTA='\e[105m'
BG_LIGHTCYAN='\e[106m'
BG_WHITE='\e[107m'

TEXT_RESET='\e[0m'    # Text Reset

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

# default:
# PS1="\h:\W \u\$ "

previous_exit_color() {
  if [ $1 -eq 0 ]; then
    echo -n "${TEXT_GREEN}" #▸${TEXT_RESET}"
  else
    #echo -n "${TEXT_RED}✘${TEXT_RESET}"
    echo -n "${TEXT_RED}" #▸${TEXT_RESET}"
  fi
}
previous_exit_bg() {
  if [ $1 -eq 0 ]; then
    echo -n "${BG_GREEN}" #▸${TEXT_RESET}"
  else
    #echo -n "${TEXT_RED}✘${TEXT_RESET}"
    echo -n "${BG_RED}" #▸${TEXT_RESET}"
  fi
}

export GIT_PS1_SHOWUPSTREAM="verbose"
export GIT_PS1_DESCRIBE_STYLE="branch" # for (master~4) style
export GIT_PS1_SHOWDIRTYSTATE=true
# export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWCOLORHINTS=true

if [[ $TERM_PROGRAM == 'iTerm.app' ]]; then
  # 0 means both tab and window, 1 is tab, 2 is window
  # see:
  #   http://www.faqs.org/docs/Linux-mini/Xterm-Title.html#ss4.3
  #   http://www.mit.edu/afs/athena/system/x11r4/src/mit/clients/xterm/ctlseq2.txt via
  #   http://ubuntuforums.org/archive/index.php/t-448614.html
  TAB_NAME='\[\e]1;${PWD/#$HOME/~}\a\]'
  WINDOW_NAME='\[\e]2;\u@\h:${PWD/#$HOME/~}\a\]'
else
  TAB_NAME=''
  WINDOW_NAME=''
fi

PROMPT_HOST="${TEXT_PURPLE}$(hostname | cut -c1)${TEXT_RESET}:";
PROMPT_DIRTRIM=2

# powerline symbols: 
# prompt: ▸ ❯

set_prompt(){
  local last=$?
  local status_color=$(previous_exit_color $last)
  local status_bg=$(previous_exit_bg $last)
  local pre="${TAB_NAME}${WINDOW_NAME}" # for the term
  # light magenta is close to white in my term:
  # pre+="\[${BG_GREEN}${TEXT_LIGHTMAGENTA}\]\t " # time
  # pre+="\[${BG_BLUE}${TEXT_GREEN}\] " # separator
  # pre+="\[${BG_BLUE}${TEXT_LIGHTMAGENTA}\]\w " # working dir
  # pre+="\[${BG_LIGHTMAGENTA}${TEXT_BLUE}\]" # separator
  # pre+="\[${TEXT_FOREGROUND}\]" # ready for next section
  pre+="\[${TEXT_BLUE}\]\w\[${TEXT_RESET}\]"
  local post=""
  # post+="\[${TEXT_LIGHTMAGENTA}${status_bg}\]"
  # post+="\[${BG_BACKGROUND}${status_color}\]\[${TEXT_RESET}\] "
  post+=" \[${status_color}\]❯\[${TEXT_RESET}\] "
  history -a # append history after each command
  # to get powerline style:
  # uncomment to remove parens, also comment out git ps1 color directive
  __git_ps1 "$pre" "$post" # " %s "
}

PROMPT_COMMAND=set_prompt

export MYSQL_PS1="\u@\h \d> "
