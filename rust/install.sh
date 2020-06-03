if which rustup-init >/dev/null; then
  rustup-init -v -y --no-modify-path
else
  echo "skipping rustup-init"
fi
