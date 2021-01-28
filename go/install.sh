if which go >/dev/null; then
  # for github:
  go env -w GOPRIVATE='*github.com/github/*'

  # used by vim
  go get -u -v github.com/jstemmer/gotags
fi