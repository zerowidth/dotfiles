[ -n "$LINUX" ] && exit 0

# latest version
latest=$(rbenv install -l 2>/dev/null | grep -E '^\d' | grep -v '-' | tail -1)
if rbenv versions | grep -q $latest; then
  echo "ruby $latest already installed, skipping"
else
  echo "installing latest ruby: $latest"
  rbenv install "$latest"
  rbenv global "$latest"

  # for local scripts
  gem install bubs

  # for vim
  gem install ripper-tags

  # for vscode
  gem install solargraph
  gem install rubocop
  gem install ruby-debug-ide
  gem install debase
  # gem install byebug
fi