let g:ale_linters = {
\   'go': ['go build', 'gofmt', 'golint', 'govet'],
\   'ruby': ['ruby'],
\}
let g:ale_lint_delay = 2000 " instead of 200ms. slow down.
