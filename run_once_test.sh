#!/bin/bash

install_homebrew() {
  if ! command -v brew >/dev/null 2>&1; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
  echo 'Homebrew installed.'
}

install_on_darwin() {
  install_homebrew
  brew install ansible
}

install_on_debian_or_ubuntu() {
  sudo apt-get update
  sudo apt-get install ansible
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