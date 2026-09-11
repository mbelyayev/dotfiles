# dotfiles

This repo contains my [chezmoi](https://www.chezmoi.io/)-managed dotfiles and [mise](https://mise.jdx.dev/) config.toml file for bootstrapping my configuration across macOS, Debian, and Ubuntu machines.

## Getting Started

### Installation

```shell
export CHEZMOI_REPO=codeberg.org/mbelyayev/dotfiles
sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- init --apply $CHEZMOI_REPO
```

### Post-Install

After installation, change into the chezmoi source directory using `z` (zoxide) or `cd` (aliased to `z`):

```shell
cd $(chezmoi source-path)
```

This is preferred to `chezmoi cd`, which spawns a new subshell.
From this point onwards, easily change into the chezmoi source directory:

```shell
cd chezmoi
```

## Workflow for dotfiles management

Managing, configurating, and editing the dotfiles, chezmoi scripts, and other files can follow a simple workflow:

```shell
cd chezmoi

# Open nvim
v
```

With nvim opened as the editor, fuzzy-find or navigate programatically (e.g., using netrw or yazi) to any chezmoi dotfile source file.

After modifying or saving one or multiple file buffers, view and inspect the changes between target (`$XDG_CONFIG_HOME`) and source using `chezmoi diff`.

Once happy with the changes, execute `chezmoi apply` to apply the changes to the target `$XDG_CONFIG_HOME` directory. 

Re-start/source programs and shells that rely on the updated configuration, and validate the applied changes.

Repeat the above process as necessary for any small update/task/objective related to the dotfiles!

Once ready, `git add/commit/push` to the remote directory. The chezmoi source files, like any important code, are version controlled. 

