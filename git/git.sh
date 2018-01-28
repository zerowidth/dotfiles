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

function gp() {
  git pull --stat --all --prune --progress --autostash &&
    git clean-merged-branches
}

function gpp() {
  git pull --stat --all --prune --progress --autostash &&
    git push
}
