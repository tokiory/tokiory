# Ideavim dotfiles

This folder is used for providing configuration for [ideavim](https://github.com/JetBrains/ideavim).

## Installation

```bash
# Clone repo
git clone git@github.com:tokiory/tokiory.git $HOME/.config/personal

# Apply dotfiles into ~/.config with chezmoi
chezmoi --source "$HOME/.config/personal/dot" --destination "$HOME/.config" apply -v
```

Inside JetBrains IDE, source configuration:

```vimrc
source ~/.config/ideavim/vimrc
```
