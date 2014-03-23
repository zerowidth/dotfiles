# set -x

[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh
unalias git

export PATH=/Users/nathan/bin:/Users/nathan/scripts:$PATH
export PATH=/Users/nathan/.cabal/bin:$PATH

export EDITOR="vim"

export HISTCONTROL=ignoredups;
export HISTSIZE=10000;
shopt -s histappend; # append not rewrite history

# export LESS='-iMRXFx4' -- says bleything
# -i case ignore | -M more verbose prompting | -R raw control chars
# -X don't reinit term | -F quit if less than one screen | -x4 tabstop of 4
export LESS='-MRXFx4'

# colorized grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;33'

# export JAVA_HOME=`/usr/libexec/java_home`

export RUBYOPT="-rubygems"
export NODE_PATH=/usr/local/lib/node_modules
export PGDATA=/usr/local/var/postgres

mkdir -p ~/go
export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/opt/boxen/homebrew/Cellar/go/1.2.1/libexec/bin

test -f ~/.secrets && {
  . ~/.secrets # api keys etc
}

alias ls='ls -FG'
alias mv='mv -nv'
alias ll='ls -lah'
alias vi='vim'
alias js='NODE_NO_READLINE=1 rlwrap node'
alias aniero="git config -l | grep remote | grep aniero | sed s/aniero/zerowidth/ | sed 's/=/ /' | xargs git config"
alias g='grep -in'
alias unlock="security unlock-keychain ~/Library/Keychains/login.keychain"

function ss() {
  if [[ -e script/server ]]; then
    if [[ -e Gemfile ]]; then
      bundle exec script/server
    else
      script/server
    fi
  elif [[ -e bin/rails ]]; then
    bundle exec rails server
  fi
}
function sc() {
  if [[ -e script/console ]]; then
    bundle exec script/console
  elif [[ -e bin/rails ]]; then
    bundle exec rails console
  fi
}
alias sb='script/bootstrap'



function wait-for-host() {
  if [ -n "$1" ]; then
    while ! ping -c 1 $1;
    do
      sleep 5
    done
    echo "$1 is up: `date`"
    growlnotify -s -w -m "$1 is up: `date`"
  else
    echo "... specify a host, n00b"
  fi
}


function wait-for-service() {
  while ! nc -z $1 $2;
  do
    sleep 5
  done
  echo "$1:$2 is up: `date`"
  growlnotify -s -w -m "$1:$2 is up: `date`"
}

function sshr() {
  if [ -n "$1" ]; then
    if [ -n "$2" ]; then
      ssh -t $1 sudo $2
    else
      ssh -t $1 sudo su -
    fi
  else
    echo "... specify a host, n00b"
  fi
}
complete -F _ssh sshr

function d() {
  if [ -n "$1" ]; then
    if [ -d "$1" ]; then
      pushd $1 >/dev/null
      if [ -d .git ]; then
        git ls-files -c --exclude-standard | grep -v vendor | ctags -L -
      else
        ctags -R
      fi
      mvim .
      popd >/dev/null
    else
      echo "$1 is not a directory"
    fi
  else
    if [ -d .git ]; then
      git ls-files -c --exclude-standard | grep -v vendor | ctags -L -
    else
      ctags -R
    fi
    mvim .
  fi
}
alias e='mvim'


alias gx="gitx --all"

function gp() {
  local dirty=false
  git diff --no-ext-diff --quiet --exit-code || dirty=true

  if [ "true" = "$dirty" ]; then
    git stash
  fi

  git fetch --all
  git pull --stat

  if [ "true" = "$dirty" ]; then
    git stash pop
  fi
}

alias gr="growlnotify -m"
alias grs="growlnotify -s -m"

alias bo="EDITOR=mvim bundle open"
alias be="bundle exec"
alias fs="foreman start"
alias bumpgems="git add -u vendor/cache Gemfile*"

# from @glv: no need to prefix bin/rake etc. in a bundle'd project
BUNDLED_COMMANDS="foreman rackup rails rake rspec ruby shotgun spec cap guard compass jekyll testrb"
## Functions
bundler-installed()
{
  which bundle > /dev/null 2>&1
}

within-bundled-project()
{
  local dir="$(pwd)"
  while [ "$(dirname $dir)" != "/" ]; do
    [ -f "$dir/Gemfile" ] && return
    dir="$(dirname $dir)"
  done
  false
}

run-with-bundler()
{
  local command="$1"
  shift
  if bundler-installed && within-bundled-project; then
    bundle exec $command $*
  else
    $command $*
  fi
}

for CMD in $BUNDLED_COMMANDS; do
  alias $CMD="run-with-bundler $CMD"
done

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

TEXT_BLACK='\[\e[0;30m\]' # Black - Regular
TEXT_RED='\[\e[0;31m\]' # Red
TEXT_GREEN='\[\e[0;32m\]' # Green
TEXT_YELLOW='\[\e[0;33m\]' # Yellow
TEXT_BLUE='\[\e[0;34m\]' # Blue
TEXT_PURPLE='\[\e[0;35m\]' # Purple
TEXT_CYAN='\[\e[0;36m\]' # Cyan
TEXT_WHITE='\[\e[0;37m\]' # White
# BLDBLK='\[\e[1;30m\]' # Black - Bold
# BLDRED='\[\e[1;31m\]' # Red
# BLDGRN='\[\e[1;32m\]' # Green
# BLDYLW='\[\e[1;33m\]' # Yellow
# BLDBLU='\[\e[1;34m\]' # Blue
# BLDPUR='\[\e[1;35m\]' # Purple
# BLDCYN='\[\e[1;36m\]' # Cyan
# BLDWHT='\[\e[1;37m\]' # White
# UNDBLK='\[\e[4;30m\]' # Black - Underline
# UNDRED='\[\e[4;31m\]' # Red
# UNDGRN='\[\e[4;32m\]' # Green
# UNDYLW='\[\e[4;33m\]' # Yellow
# UNDBLU='\[\e[4;34m\]' # Blue
# UNDPUR='\[\e[4;35m\]' # Purple
# UNDCYN='\[\e[4;36m\]' # Cyan
# UNDWHT='\[\e[4;37m\]' # White
# BAKBLK='\[\e[40m\]'   # Black - Background
# BAKRED='\[\e[41m\]'   # Red
# BAKGRN='\[\e[42m\]'   # Green
# BAKYLW='\[\e[43m\]'   # Yellow
# BAKBLU='\[\e[44m\]'   # Blue
# BAKPUR='\[\e[45m\]'   # Purple
# BAKCYN='\[\e[46m\]'   # Cyan
# BAKWHT='\[\e[47m\]'   # White
TEXT_RESET='\[\e[0m\]'    # Text Reset

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

export GIT_PS1_SHOWUPSTREAM="git verbose"
export GIT_PS1_DESCRIBE_STYLE="branch"
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWCOLORHINTS=true

git_dirty_flag() {
  if [ "true" = "$(git rev-parse --is-inside-work-tree 2>/dev/null)" ]; then

    # modifications of tracked files
    # git diff-files --no-ext-diff --ignore-submodules --exit-code --quiet \
    # now, from __git_ps1:
    git diff --no-ext-diff --quiet --exit-code \
      || echo -n "${TEXT_YELLOW}*${TEXT_RESET}"

    # staged hunks
    if git rev-parse --quiet --verify HEAD >/dev/null; then
      # git diff-index --no-ext-diff --ignore-submodules --cached --exit-code HEAD --quiet \
      git diff-index --cached --quiet HEAD -- \
        || echo -n "${TEXT_GREEN}+${TEXT_RESET}"
    fi

    # untracked files
    if [ -n "$(git ls-files --others --exclude-standard)" ]; then
      echo -n "${TEXT_CYAN}?${TEXT_RESET}"
    fi

    # stashed changes
    git rev-parse --verify refs/stash >/dev/null 2>&1 && echo -n "${TEXT_PURPLE}\$${TEXT_RESET}"
  fi
}

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

PROMPT_HOST="${TEXT_PURPLE}\h${TEXT_RESET}";

set_prompt(){
  status_color=$(previous_exit_color $?)
  history -a # append history after each command
  __git_ps1 "${TAB_NAME}${WINDOW_NAME}${PROMPT_HOST}:${TEXT_BLUE}\w${TEXT_RESET}" " ${status_color}▸${TEXT_RESET} "
}

PROMPT_COMMAND=set_prompt

set -o vi

# from http://limestone.truman.edu/~dbindner/mirror/bash_bindings.txt
# For those who want to use Vi bindings in bash, this corrects a
# few annoyances:
#
# 1) up and down arrows retrieve history lines even in insert mode
# 2) left and right arrows work in insert mode
# 3) Ctrl-A and Ctrl-E work how you expect if you have had to
#    live in Emacs mode in the past.
# 4) So does Ctrl-D.

## Command-mode bindings
# up arrow or PgUp: append to previous history line
 bind -m vi-command '"[A": "kA"'
 bind -m vi-command '"[5~": "kA"'
# dn arrow or PgDn: append to next history line
 bind -m vi-command '"[B": "jA"'
 bind -m vi-command '"[6~": "jA"'
# rt arrow: space then append (doesn't work right at column 1)
 bind -m vi-command '"[C": "\ a"'
# lt arrow: insert before this char
 bind -m vi-command '"[D": vi-insertion-mode'
# Ctrl-A or Home: insert at line beginning like in emacs mode
 bind -m vi-command 'Control-a: vi-insert-beg'
 bind -m vi-command '"[7~": vi-insert-beg'
# Ctrl-E or End: append at line end like in emacs mode
 bind -m vi-command 'Control-e: vi-append-eol'
 bind -m vi-command '"[8~": vi-append-eol'
# to switch to emacs editing mode
 bind -m vi-command '"ZZ": emacs-editing-mode'

## Insert-mode bindings
# Ctrl-A: insert at line start like in emacs mode
 bind -m vi-insert 'Control-a: beginning-of-line'
# Ctrl-E: append at line end like in emacs mode
 bind -m vi-insert 'Control-e: end-of-line'
# Ctrl-D: delete character
 bind -m vi-insert 'Control-d: delete-char'
# Ctrl-L: clear screen
 bind -m vi-insert 'Control-l: clear-screen'

## Emacs bindings
# Meta-V: go back to vi editing
 # bind -m emacs '"\ev": vi-editing-mode'i

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# ----- load up work script / bash functions ----- #

# use this for setting EMAIL, for host-specific git email addresses
# as well as any work-specific load paths, commands, helpers, etc.
test -f ~/work/environment.sh && {
  . ~/work/environment.sh
# ----- haskell/cabal helpers ----- #
# unregister broken GHC packages. Run this a few times to resolve dependency rot in installed packages.
# ghc-pkg-clean -f cabal/dev/packages*.conf also works.
function ghc-pkg-clean() {
    for p in `ghc-pkg check $* 2>&1  | grep problems | awk '{print $6}' | sed -e 's/:$//'`
    do
        echo unregistering $p; ghc-pkg $* unregister $p
    done
}

# remove all installed GHC/cabal packages, leaving ~/.cabal binaries and docs in place.
# When all else fails, use this to get out of dependency hell and start over.
function ghc-pkg-reset() {
    read -p 'erasing all your user ghc and cabal packages - are you sure (y/n) ? ' ans
    test x$ans == xy && ( \
        echo 'erasing directories under ~/.ghc'; rm -rf `find ~/.ghc -maxdepth 1 -type d`; \
        echo 'erasing ~/.cabal/lib'; rm -rf ~/.cabal/lib; \
        # echo 'erasing ~/.cabal/packages'; rm -rf ~/.cabal/packages; \
        # echo 'erasing ~/.cabal/share'; rm -rf ~/.cabal/share; \
        )
}

alias cabalupgrades="cabal list --installed  | egrep -iv '(synopsis|homepage|license)'"

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

true # last command should have a zero exit code!
