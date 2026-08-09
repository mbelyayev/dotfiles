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

# Homebrew
if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  if $IS_LINUX; then
cat >> ~/.bashrc << 'EOF'
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"
EOF
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"
  else
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
  brew update
fi
echo 'Homebrew installed.'

# Docker
if ! command -v docker >/dev/null 2>&1; then
  if $IS_LINUX; then
    # Uninstall conflicting packages
    sudo apt remove -y docker.io docker-compose docker-compose-v2 docker-doc docker-buildx podman-docker containerd runc

    # Set up Docker's apt repository
    sudo apt update
    sudo apt install -y ca-certificates curl
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL "https://download.docker.com/linux/$ID/gpg" -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc

sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/$ID
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/docker.asc
EOF
    sudo apt update

    # Install latest Docker version
    sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    sudo systemctl status docker --no-pager
  else
    brew install --cask docker 
  fi
fi
echo 'Docker installed.'

# uv toolchain for Python
if ! command -v uv >/dev/null 2>&1; then
  curl -LsSf https://astral.sh/uv/install.sh | sh
  if $IS_LINUX; then
    echo 'eval "$(uv generate-shell-completion bash)"' >> ~/.bashrc
  else
    echo 'eval "$(uv generate-shell-completion zsh)"' >> ~/.zshrc
  fi
fi
echo 'uv installed.'

