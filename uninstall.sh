#!/bin/bash

set -eou pipefail

IS_LINUX=false
if [[ $(uname -s) == "Linux" ]]; then
  IS_LINUX=true
  . /etc/os-release
  if [[ $ID != "ubuntu" && $ID != "debian" ]]; then
    exit 0
  fi
  MSG_SYS_INFO="OS: Linux, Distribution: $PRETTY_NAME"
elif [[ $(uname -s) == "Darwin" ]]; then
  MSG_SYS_INFO="OS: macOS, Version: $(sw_vers -productVersion)"
else
  exit 0
fi
echo "$MSG_SYS_INFO"
printf '%0.s>' $(seq 1 "${#MSG_SYS_INFO}")
printf "\n"

# uv toolchain for Python
if command -v uv >/dev/null 2>&1; then
  uv cache clean
  rm -r "$(uv python dir)"
  rm -r "$(uv tool dir)"
  rm ~/.local/bin/uv ~/.local/bin/uvx
  if $IS_LINUX; then
    sed -i '/eval "$(uv generate-shell-completion bash)"/d' ~/.bashrc
  else  
    sed -i '/eval "$(uv generate-shell-completion zsh)"/d' ~/.zshrc
  fi
fi
echo 'uv uninstalled.'

# Docker
if command -v docker >/dev/null 2>&1; then
  if $IS_LINUX; then
    sudo apt purge docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras
    sudo rm -rf /var/lib/docker
    sudo rm -rf /var/lib/containerd
    sudo rm /etc/apt/sources.list.d/docker.sources
    sudo rm /etc/apt/keyrings/docker.asc
  else
    brew uninstall --cask docker --force
    brew uninstall --formula docker --force
    brew cleanup
    rm -rf \
      ~/Library/Containers/com.docker.docker \
      ~/Library/Application\ Support/Docker\ Desktop \
      ~/Library/Group\ Containers/group.com.docker \
      ~/Library/Preferences/com.docker.docker.plist \
      ~/Library/Saved\ Application\ State/com.electron.docker.savedState \
      ~/Library/Logs/Docker\ Desktop \
      ~/Library/Caches/com.docker.docker \
      ~/.docker
  fi
fi

# Homebrew
if command -v brew >/dev/null 2>&1; then
  curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh | bash
  if $IS_LINUX; then
    sed -i '/eval "$(\/home\/linuxbrew\/.linuxbrew\/bin\/brew shellenv bash)"/d' ~/.bashrc
    sudo rm -rf /home/linuxbrew
  else
    sed -i '/eval "$(\/opt\/homebrew\/bin\/brew shellenv)"/d' ~/.zprofile
    sudo rm -rf /opt/homebrew
  fi
fi
echo 'Homebrew uninstalled.'
