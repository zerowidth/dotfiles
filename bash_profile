export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=/Users/nathan/bin:/Users/nathan/scripts:$PATH #/Users/nathan/bin/gitflow:$PATH

export LD_LIBRARY_PATH=/usr/local/lib

export EDITOR="/usr/local/bin/vim -f"

# for textmate svn
export LC_ALL=
export LC_CTYPE=en_US.UTF-8

# colorized grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;33'

export JAVA_HOME=/Library/Java/Home

export RUBYOPT="-rubygems"

export NODE_PATH=/usr/local/lib/node

export PGDATA=/usr/local/var/postgres

. ~/.secrets # api keys etc

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

alias ls='ls -FG'
alias ll='ls -lah'
alias mv='mv -nv'
alias vi='vim'
alias js='NODE_NO_READLINE=1 rlwrap node'

alias irc="echo -n \$'\e]0;irc\a'; ssh -t zerowidth-tunnel TERM=screen screen -U -x i"

alias g='grep -in'

alias desktop="cd ~/Desktop"

alias pgskip="psql skipme"

function d() {
  if [ -n "$1" ]; then
    if [ -d "$1" ]; then
      pushd $1 >/dev/null
      ctags -R
      # mvim --servername $(basename $(pwd)) --remote-silent .
      mvim .
      popd >/dev/null
    else
      echo "$1 is not a directory"
    fi
  else
    ctags -R
    # mvim --servername $(basename $(pwd)) --remote-silent .
    mvim .
    # echo "specify a directory to edit"
  fi
}
function sd() {
  if [ -d "$1" ]; then
    pushd $1 >/dev/null
    sudo ctags -R
    sudo mvim -c :NT
    popd >/dev/null
  else
    sudo ctags -R
    sudo mvim -c :NT
  fi
}
alias e='mvim'

alias sp='spec -cfs -Du'
alias spb='spec -bcfs -Du'

alias gx="gitx --all"

function gemdir() {
  cd `rvm gempath | cut -d: -f 1`"/gems"
}

# alias mateup="
#   pushd ~/Library/Application\ Support/TextMate/Bundles; svn up; svn st; popd;
#   pushd /Library/Application\ Support/TextMate/Bundles/Git.tmbundle; git pull; popd;
#   pushd /Library/Application\ Support/TextMate/Support; svn up; svn st; popd;
#   pushd ~/Library/Application\ Support/TextMate/Themes; svn up; svn st; popd;
#   osascript -e 'tell app \"TextMate\" to reload bundles'
# "

# export MYSQL_PS1="\u@\h \d> "

# -------------------------------------------------#

# zero() {
#   if [ -n "$1" ]; then
#     for f in $@; do
#       echo "zeroing $f"
#       cat /dev/null > $f
#     done
#   else
#     echo "specify some log files to zero, yo"
#   fi
# }

# via mojombo http://gist.github.com/180587
function psg {
  ps wwwaux | egrep "($1|%CPU)" | grep -v grep
}

function ssh-setup {
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

# COLOR_BLACK="\[\e[30;40m\]"
# COLOR_RED="\[\e[31;40m\]"
# COLOR_GREEN="\[\e[32;40m\]"
# COLOR_YELLOW="\[\e[33;40m\]"
# COLOR_BLUE="\[\e[34;40m\]"
# COLOR_MAGENTA="\[\e[35;40m\]"
# COLOR_CYAN="\[\e[36;40m\]"
# COLOR_NONE="\[\e[0m\]"

# COLOR_RED_BOLD="\[\e[31;1m\]"
# COLOR_GREEN_BOLD="\[\e[32;1m\]"
# COLOR_YELLOW_BOLD="\[\e[33;1m\]"
# COLOR_BLUE_BOLD="\[\e[34;1m\]"
# COLOR_MAGENTA_BOLD="\[\e[35;1m\]"
# COLOR_CYAN_BOLD="\[\e[36;1m\]"

# http://peepcode.com/system/uploads/2007/setprompt.txt
# parse_git_branch() {
#   git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
# }

# thanks to http://b.logi.cx/2008/5/5/git-bash-awk-crazy-delicious and comments
# git_dirty_flag() {
#   git status 2> /dev/null | grep -c : | awk '{if ($1 > 0) print "⚡"}'
# }

# set_prompt()
# {
#     previous_value=$?;
#     # PS1="${COLOR_GREEN}\u@\h${COLOR_NONE}:${COLOR_CYAN}\w"
#     prompt="${COLOR_GREEN}\w${COLOR_NONE}$(__git_ps1)${COLOR_YELLOW}$(git_dirty_flag)${COLOR_NONE} "
#     if test $previous_value -eq 0
#     then
#         PS1="${prompt}➔ "
#     else
#         PS1="${prompt}${COLOR_RED}➔${COLOR_NONE} "
#     fi
# }
# PROMPT_COMMAND=set_prompt
# PS1="${PS1}${COLOR_NONE}\$ "
# PS1="${PS1}${COLOR_RED}\$${COLOR_NONE} "

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

previous_exit_status() {
  if [ $1 -eq 0 ]; then
    # HEAVY ROUND-TIPPED RIGHTWARDS ARROW
    echo -n "▸"
    # echo -n "➜"
    #echo -n "•"
    # echo -n "⧫"
  else
    # HEAVY BALLOT X
    echo -n "${TEXT_RED}✘${TEXT_RESET}"
  fi
}

# good bits are all via git-completion.bash from git.
# using custom function to allow for colors instead of the
#   GIT_PS1_SHOWDIRTYSTATE
#   GIT_PS1_SHOWSTASHSTATE
#   GIT_PS1_SHOWUNTRACKEDFILES
# environment variables.
git_dirty_flag() {
  if [ "true" = "$(git rev-parse --is-inside-work-tree 2>/dev/null)" ]; then

    # modifications of tracked files
    # git diff-files --no-ext-diff --ignore-submodules --exit-code --quiet \
    # now, from __git_ps1:
    git diff --no-ext-diff --ignore-submodules --quiet --exit-code \
      || echo -n "${TEXT_YELLOW}*${TEXT_RESET}"

    # staged hunks
    if git rev-parse --quiet --verify HEAD >/dev/null; then
      git diff-index --no-ext-diff --ignore-submodules --cached --exit-code HEAD --quiet \
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

TAB_NAME='\[\e\]]1;\w\[\a\]'
TAB_NAME=''
WINDOW_NAME='\[\e\]]2;\u@\h:\w\[\a\]'
WINDOW_NAME='' # commented out for Terminal.app tabs

set_prompt(){
  previous=$?;
  PS1="${TAB_NAME}${WINDOW_NAME}$(rvm-prompt v s g) ${TEXT_GREEN}\w${TEXT_RESET}$(__git_ps1)$(git_dirty_flag) $(previous_exit_status $previous) "
}

PROMPT_COMMAND=set_prompt

# a     black
# b     red
# c     green
# d     brown
# e     blue
# f     magenta
# g     cyan
# h     light grey
# A     bold black, usually shows up as dark grey
# B     bold red
# C     bold green
# D     bold brown, usually shows up as yellow
# E     bold blue
# F     bold magenta
# G     bold cyan
# H     bold light grey; looks like bright white
# x     default foreground or background
# directory -----\
# symlink        +-\
# socket         +-+-\
# pipe           +-+-+-\
# executable     +-+-+-+-\
# block special  +-+-+-+-+-\
# char special   +-+-+-+-+-+-\
# suid           +-+-+-+-+-+-+-\
# setguid        +-+-+-+-+-+-+-+-\
# write+sticky/  +-+-+-+-+-+-+-+-+-\
# write-sticky/  +-+-+-+-+-+-+-+-+-+-\
#                v v v v v v v v v v v
export LSCOLORS="gxfxcxdxbxegedabagacad"
# default:      "exfxcxdxbxegedabagacad"

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
 bind -m emacs '"\ev": vi-editing-mode'i

set -o vi

if [[ -s "$HOME/.rvm/scripts/rvm" ]]  ; then source "$HOME/.rvm/scripts/rvm" ; fi
alias rl="rvm list"


# ----- load up work script / bash functions ----- #
. ~/work/ci_environment.sh

