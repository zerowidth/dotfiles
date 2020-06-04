[ -n "$LINUX" ] && return

# Install Brew if it's not already installed
if ! [ -x "$(command -v brew)" ]; then
  echo "Installing brew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

  # Install dependencies defined in Brewfile
  brew tap Homebrew/bundle
  brew update
fi

echo "Updating homebrew"
brew update
brew bundle -v --file="$HOME/.dotfiles/homebrew/Brewfile"
