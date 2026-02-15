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

# 3) Preview changes
chezmoi --source "$HOME/.config/personal/dot" --destination "$HOME/.config" diff

# 4) Apply
chezmoi --source "$HOME/.config/personal/dot" --destination "$HOME/.config" apply -v
```

# Sync (with chezmoi)

We use `chezmoi` because it is safer and easier to maintain than a custom symlink script:

- Clear `diff` before applying changes
- Predictable sync workflow across machines
- Easy rollback to the committed source state

## Sync up with latest changes

```bash
git -C "$HOME/.config/personal" pull
chezmoi --source "$HOME/.config/personal/dot" --destination "$HOME/.config" apply -v
```

## Diff local changes

```bash
chezmoi --source "$HOME/.config/personal/dot" --destination "$HOME/.config" diff
```

Tip: add a short alias:

```bash
alias czcfg='chezmoi --source "$HOME/.config/personal/dot" --destination "$HOME/.config"'
```

Then use `czcfg apply -v`, `czcfg diff`, `czcfg status`.

# Author & Contribution

- Author: [@tokiory](https://github.com/tokiory)
- Contributions are welcome through issues and pull requests.
