[ -n "$LINUX" ] && return

# latest version
latest=$(rbenv install -l | grep -E '^\d' | grep -v '-' | tail -1)
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