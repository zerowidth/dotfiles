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
alias gcm="git checkout \$(git main-branch)"
alias gd="git diff"
alias gi="git di"
alias gdi="git di"

function gp() {
  git pull --stat --all --prune --progress --autostash &&
    git clean-merged-branches
}

function gpp() {
  git pull --stat --all --prune --progress --autostash &&
    git push
}

function main-branch() {
  git branch -m master main
  git fetch origin
  git branch -u origin/main main
}
