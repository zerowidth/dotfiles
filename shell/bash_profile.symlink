# set -x

export PATH=${PATH}:/usr/local/sbin
export PATH=/Users/nathan/bin:/Users/nathan/scripts:$PATH

export EDITOR="vim"

export HISTCONTROL=ignoredups;
export HISTSIZE=10000;
shopt -s histappend; # append not rewrite history

# -i case ignore | -M more verbose prompting | -R raw control chars
# -X don't reinit term | -F quit if less than one screen | -x4 tabstop of 4
export LESS='-MRXFx4'

# colorized grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;33'

export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin

test -f ~/.secrets && . ~/.secrets

alias ls='ls -FG'
alias ll='ls -lah'
alias mv='mv -nv'
alias unlock="security unlock-keychain ~/Library/Keychains/login.keychain"
alias rehash='hash -r'
alias p4="ping 4.2.2.2"
alias ia="open -a 'IA Writer' "

function up() {
  set -e
  echo '--- brew ---'
  brew update
  brew outdated
  brew upgrade
  brew cu --cleanup --no-brew-update --yes
  brew cleanup
  echo '--- vim ---'
  pushd ~/.vim >/dev/null
  rake
  popd >/dev/null
}

# because macos forgets how to use cameras sometimes
alias kill-camera="sudo killall VDCAssistant"

# quickly get to the real path (e.g. go project symlinks)
alias cdr='cd $(pwd -P)'

# format ag output for markdown
alias mdformat='ruby -lne '\''x, y = $_.split(/\s+/,2); puts "* #{x} `#{y}`"'\'''

function ss() {
  local bundle="bundle"
  if [ -x bin/bundle ]; then
    bundle="bin/bundle"
  fi
  if [[ -e script/server ]]; then
    if [[ -e Gemfile ]]; then
      $bundle exec script/server
    else
      script/server
    fi
  elif [[ -e bin/rails ]]; then
    $bundle exec rails server
  else
    echo "no server here"
    return 1
  fi
}
function sc() {
  local bundle="bundle"
  if [ -x bin/bundle ]; then
    bundle="bin/bundle"
  fi
  if [[ -e script/console ]]; then
    $bundle exec script/console
  elif [[ -e bin/rails ]]; then
    $bundle exec rails console
  else
    echo "no console here"
    return 1
  fi
}
alias sb='script/bootstrap --local'
alias sv='script/vendor'
alias st='script/test'
alias cst='clear; script/test'

function bo() {
  local bundle="bundle" paths path
  if [ -x bin/bundle ]; then
    bundle="bin/bundle"
  fi
  if ! paths=$($bundle show --paths); then
    echo "$paths"
    return 1
  fi
  if [ $# -gt 0 ]; then
    path=$(echo "$paths" | fzf -d/ --nth=-1 --with-nth=-1 -1 -q "$@")
  else
    path=$(echo "$paths" | fzf -d/ --nth=-1 --with-nth=-1 -1)
  fi
  if [ -n "$path" ]; then
    d "$path"
  else
    return 1
  fi
}

function be() {
  local bundle="bundle"
  if [ -x bin/bundle ]; then
    bundle="bin/bundle"
  fi
  $bundle exec "$@"
}

alias scan-ssh="dns-sd -B _ssh._tcp"

function d() {
  local dir="."
  if [ -n "$1" ]; then
    if [ -d "$1" ]; then
      dir=${1%/} # strip trailing slash so vim stays happy
      shift
    else
      echo "$1 is not a directory?"
      return 1
    fi
  fi
  pushd "$dir" >/dev/null || return 1
  mvim +Refresh "$dir" "$@"
  popd >/dev/null || return 1
}

function e() {
  if [ -n "$1" ]; then
    local file dir
    file=$(basename "$1")
    dir=$(dirname "$1")
    shift
    pushd "$dir" >/dev/null || return 1
    mvim "$file" "$@"
    popd >/dev/null || return 1
  else
    mvim "$@"
  fi
}

function gp() {
  git pull --stat --all --prune --progress --autostash &&
    git clean-merged-branches
}

function gpp() {
  git pull --stat --all --prune --progress --autostash &&
    git push
}

# Run a command, copying the command line first and then capturing the output.
# This is in support of the alfred github details snippet
function details() {
  if [ $# = 0 ]; then
    echo -n "details <command> captures the command and its output "
    echo "for the 'details' alfred snippet"
    return
  fi
  echo "capturing output of ${*}..."
  echo "\$ $*" | pbcopy
  sleep 1 # let alfred pick it up
  "$@" | pbcopy
  echo "done."
}

function g() {
  if [[ $# -gt 0 ]]; then
    git "$@"
  else
    git status --short --branch -uall
  fi
}
alias gam="git amend"
alias gap="git ap"
alias gbn="git branchname"
alias gc-="git co -"
alias gcb="git co -b"
alias gci="git ci"
alias gcm="git co master"
alias gco="git co"
alias gcr="git cor"
alias gls="git ls"
alias gd="git diff"
alias gi="git di"
alias gdi="git di"
# alias gs="git stash"
# alias gss="git stash show -p"
# alias gst="git st"
# alias gsp="git stash pop"

export MYSQL_PS1="\u@\h \d> "

function ssh-setup {
  ssh $1 'mkdir .ssh; chmod 700 .ssh; touch .ssh/authorized_keys; chmod 600 .ssh/authorized_keys'
  cat ~/.ssh/id_rsa.pub | ssh $1 'cat - >> ~/.ssh/authorized_keys'
}

# sweetness from tim pease:
p() {
  if [ -n "$1" ]; then
    ps -O ppid -U $USER | grep -i "$1" | grep -v grep
  else
    ps -O ppid -U $USER
  fi
}

pkill() {
  if [ -z "$1" ]; then
    echo "Usage: pkill [process name]"
    return 1
  fi

  local pid
  pid=$(p $1 | awk '{ print $1 }')

  if [ -n "$pid" ]; then
    echo -n "Killing \"$1\" (process $pid)..."
    kill -9 $pid
    echo "done."
  else
    echo "Process \"$1\" not found."
  fi
}

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

if [[ -f ~/.github.sh ]]; then
  . ~/.github.sh
fi

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

if [ -d /usr/local/opt/git/share/git-core/contrib/diff-highlight ]; then
  export PATH=$PATH:/usr/local/opt/git/share/git-core/contrib/diff-highlight
else
  echo 'diff-highlight not found'
fi

which -s rbenv && eval "$(rbenv init -)" || echo "no rbenv"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

true # last command should have a zero exit code
