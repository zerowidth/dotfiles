if which rustup-init >/dev/null; then
  rustup-init -v -y --no-modify-path
else
  echo "rustup-init not found, skipping"
fi
