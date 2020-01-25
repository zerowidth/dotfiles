export HISTCONTROL=ignoredups;
export HISTSIZE=10000;
shopt -s histappend; # append not rewrite history

# -i case ignore | -M more verbose prompting | -R raw control chars
# -X don't reinit term | -F quit if less than one screen | -x4 tabstop of 4
export LESS='-MRXFx4'

# colorized grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;33'

# for programs like ttyrec, which expect SHELL to match
export SHELL=/usr/local/bin/bash
