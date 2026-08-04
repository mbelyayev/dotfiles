#!/bin/bash

# Homebrew
if command -v brew >/dev/null 2>&1; then
  curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh | bash
fi