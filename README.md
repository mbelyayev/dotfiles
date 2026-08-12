# dotfiles

This repo contains the configuration to setup all my machines.

## How to install

```shell
export CHEZMOI_REPO=codeberg.org/mbelyayev/dotfiles
sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- init --apply $CHEZMOI_REPO
```