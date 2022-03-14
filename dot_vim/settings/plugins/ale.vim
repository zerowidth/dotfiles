let g:ale_linters = {
\   'go': ['gobuild', 'golangci-lint'],
\   'ruby': ['ruby'],
\}

let g:ale_lint_on_text_changed='insert' " only lint when text was inserted
let g:ale_lint_delay = 2000 " instead of 200ms. slow down.
let g:ale_go_golangci_lint_options = '--no-config -E gosec -E stylecheck -E unparam -e ST1003'

" include current working directory so protoc can resolve things
let g:ale_proto_protoc_gen_lint_options='-I . -I api/v0'
