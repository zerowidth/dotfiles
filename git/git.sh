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
alias gnb="git co -b"
alias gci="git ci"
alias gcm="git co master"
alias gd="git diff"
alias gi="git di"
alias gdi="git di"

alias gdiff="git diff --no-index"

function gp() {
  git pull --stat --all --prune --progress --autostash &&
    git clean-merged-branches
}

function gpp() {
  git pull --stat --all --prune --progress --autostash &&
    git push
}
