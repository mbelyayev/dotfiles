#!/bin/bash

OS="$(uname -s)"
case $OS in
  Darwin*)
    echo "Darwin"
    ;;
  Linux*)
    echo "Linux"
    ;;
  *)
    echo "Unsupported operating system: ${OS}"
    exit 0
    ;;
esac