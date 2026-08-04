#!/bin/bash

# Homebrew
if command -v brew >/dev/null 2>&1; then
  curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh | bash
fi
echo 'Homebrew uninstalled.'

# Docker
brew uninstall docker docker-compose
echo 'Docker uninstalled.'

# uv toolchain for Python
if command -v uv >/dev/null 2>&1; then
  uv cache clean
  rm -r "$(uv python dir)"
  rm -r "$(uv tool dir)"

  rm ~/.local/bin/uv ~/.local/bin/uvx
fi
echo 'uv uninstalled.'