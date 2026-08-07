#!/bin/bash
set -eou pipefail

IS_LINUX=false
if [[ $(uname -s) == "Linux" ]]; then
  IS_LINUX=true
  . /etc/os-release
  MSG_INSTALL_INFO="OS: Linux, Distribution: $PRETTY_NAME"
elif [[ $(uname -s) == "Darwin" ]]; then
  MSG_INSTALL_INFO="OS: macOS, Version: $(sw_vers -productVersion)"
else
  exit 0
fi
echo $MSG_INSTALL_INFO
printf '%0.s>' $(seq 1 "${#MSG_INSTALL_INFO}")
printf "\n"

# Homebrew
if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  if [[ $(uname -s) == "Linux" ]]; then
cat >> ~/.bashrc << 'EOF'
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"
EOF
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

