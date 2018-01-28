echo "Installing brew"

# Install Brew if it's not already installed
if ! [ -x "$(command -v brew)" ]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  # Install dependencies defined in Brewfile
  brew tap Homebrew/bundle
  brew update
  brew bundle --file="$HOME/.dotfiles/homebrew/Brewfile"
fi

