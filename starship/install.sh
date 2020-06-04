test -z "$LINUX" && exit

if type starship >/dev/null; then
  echo "starship already installed, skipping"
else
  curl -fsSL https://starship.rs/install.sh -o /tmp/starship-install.sh && \
  bash /tmp/starship-install.sh --yes
fi