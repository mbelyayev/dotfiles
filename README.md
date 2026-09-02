# dotfiles

This repo contains my [chezmoi](https://www.chezmoi.io/)-managed dotfiles and [mise](https://mise.jdx.dev/) config.toml file for bootstrapping my configuration across macOS, Debian, and Ubuntu machines.

## How to install

```shell
export CHEZMOI_REPO=codeberg.org/mbelyayev/dotfiles
sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- init --apply $CHEZMOI_REPO
```
