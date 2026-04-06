#!/bin/sh
echo "==> Setting up Node.js via fnm..."
if command -v fnm &>/dev/null; then
  fnm install 24
  fnm default 24
else
  echo "   fnm not found, skipping"
fi
