#!/bin/bash

# Homebrew
if ! command -v brew >/dev/null 2>&1; then
  curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash
  if [[ $(uname -s) == "Linux" ]]; then
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"' >> ~/.bashrc
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"
  elif [[ $(uname -s) == "Darwin" ]]; then
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
  brew update
fi
echo 'Homebrew installed.'

# Docker
brew install docker docker-compose
echo 'Docker installed.'

# uv toolchain for Python
if ! command -v uv >/dev/null 2>&1; then
  curl -LsSf https://astral.sh/uv/install.sh | sh
  if [[ $(uname -s) == "Linux" ]]; then
    echo 'eval "$(uv generate-shell-completion bash)"' >> ~/.bashrc
  elif [[ $(uname -s) == "Darwin" ]]; then
    echo 'eval "$(uv generate-shell-completion zsh)"' >> ~/.zshrc
  fi
fi
echo 'uv installed.'
