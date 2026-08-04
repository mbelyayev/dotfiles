#!/bin/bash

# uv toolchain for Python
if command -v uv >/dev/null 2>&1; then
  uv cache clean
  rm -r "$(uv python dir)"
  rm -r "$(uv tool dir)"

  rm ~/.local/bin/uv ~/.local/bin/uvx
fi
echo 'uv uninstalled.'

# Docker
brew uninstall docker docker-compose
echo 'Docker uninstalled.'

# Homebrew
if command -v brew >/dev/null 2>&1; then
  curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh | bash
  if [[ $(uname -s) == "Linux" ]]; then
    sed -i '/eval "$(\/home\/linuxbrew\/.linuxbrew\/bin\/brew shellenv bash)"/d' ~/.bashrc
    sudo rm -rf /home/linuxbrew
  elif [[ $(uname -s) == "Darwin" ]]; then
    sed -i '/eval "$(\/opt\/homebrew\/bin\/brew shellenv)"/d' ~/.zprofile
    sudo rm -rf /opt/homebrew
  fi
fi
echo 'Homebrew uninstalled.'
