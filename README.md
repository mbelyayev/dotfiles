# dotfiles

This repo contains chezmoi-managed dotfiles and Ansible playbooks for setting up my configuration across macOS, Debian, and Ubuntu machines.

## How to install

```shell
export CHEZMOI_REPO=codeberg.org/mbelyayev/dotfiles
sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- init --apply $CHEZMOI_REPO
```
