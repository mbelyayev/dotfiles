#!/bin/bash

install_homebrew() {
  if ! command -v brew >/dev/null 2>&1; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
  brew update
  echo 'Homebrew installed.'
}

install_mise() {
  if ! command -v mise >/dev/null 2>&1; then
    curl https://mise.run | sh
  fi
  ~/.local/bin/mise --version
  mise doctor
  echo 'Mise installed.'
}

install_on_darwin() {
  install_homebrew
  install_mise
  brew install ansible
}

install_on_debian_or_ubuntu() {
  sudo apt-get update
  sudo apt-get install -y build-essential ca-certificates curl git
  install_mise
  sudo apt-get install -y ansible
}
  

OS="$(uname -s)"
case $OS in
  Darwin*)
    install_on_darwin
    ;;
  Linux*)
    . /etc/os-release
    if [[ $ID != "ubuntu" && $ID != "debian" ]]; then
      echo "Unsupported Linux distro: ${PRETTY_NAME}"
      exit 0 
    fi
    install_on_debian_or_ubuntu
    ;;
  *)
    echo "Unsupported operating system: ${OS}"
    exit 0
    ;;
esac

ansible-playbook --ask-become-pass ~/.local/share/chezmoi/ansible/bootstrap.yml