# tokiory/dot

Personal dotfiles for my daily development setup. This directory is the source of truth, and configs are synced into `~/.config`.

## Configurations

- Neovim (`dot/neovim`)
- IdeaVim (`dot/ideavim`)

## How to install it

```bash
# 1) Clone repository
git clone git@github.com:tokiory/tokiory.git "$HOME/.config/personal"

# 2) Install chezmoi (macOS)
brew install chezmoi

# 3) Bootstrap from this repository (installs `~/.config/chezmoi/chezmoi.local.toml`)
chezmoi --source "$HOME/.config/personal/dot" --destination "$HOME/.config" --mode symlink apply -v

# 4) Preview/apply using configured defaults
chezmoi --config "$HOME/.config/chezmoi/chezmoi.local.toml" diff
chezmoi --config "$HOME/.config/chezmoi/chezmoi.local.toml" apply -v
```

# Sync (with chezmoi)

We use `chezmoi` because it is safer and easier to maintain than a custom symlink script:

- Clear `diff` before applying changes
- Predictable sync workflow across machines
- Easy rollback to the committed source state

## Sync up with latest changes

```bash
git -C "$HOME/.config/personal" pull
chezmoi --config "$HOME/.config/chezmoi/chezmoi.local.toml" apply -v
```

## Diff local changes

```bash
chezmoi --config "$HOME/.config/chezmoi/chezmoi.local.toml" diff
```

`chezmoi/chezmoi.local.toml` sets:

- `sourceDir = ~/.config/personal/dot`
- `destDir = ~/.config`
- `mode = symlink`

Optional alias:

```bash
alias czcfg='chezmoi --config "$HOME/.config/chezmoi/chezmoi.local.toml"'
```

Then use `czcfg apply -v`, `czcfg diff`, `czcfg status`.

# Author & Contribution

- Author: [@tokiory](https://github.com/tokiory)
- Contributions are welcome through issues and pull requests.
