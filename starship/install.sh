test -z "$LINUX" && exit 0

if type starship >/dev/null; then
  echo "starship already installed, skipping"
else
  url="https://github.com/starship/starship/releases/latest/download/starship-x86_64-unknown-linux-gnu.tar.gz"
  curl --silent --fail --location "$url" | tar xzvf - -C ~/.dotfiles/bin
fi
