#!/bin/bash

if ! command -v brew >/dev/null 2>&1; then
  curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash
  if [[ $(uname -s) == "Linux" ]]; then
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"' >> ~/.bashrc
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"
    echo 'Added brew to PATH for Linux.'
  elif [[ $(uname -s) == "Darwin" ]]; then
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
  brew update
fi
echo 'Homebrew installed.'
