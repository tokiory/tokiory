#!/bin/bash
# Author: tokiory
# Description:
# Computes which shell user is using and creates a czcfg alias for using chezmoi with the current config


CONFIG_FILE=""
CONFIG_PATH='$HOME/.config/chezmoi/chezmoi.local.toml'
ALIAS_LINE="alias czcfg='chezmoi --config $CONFIG_PATH'"

echo "Current shell is: $SHELL"
echo "Setting up czcfg alias for using chezmoi local config..."

case "$SHELL" in
    *zsh*)
        if grep -q "alias czcfg='chezmoi --config \\$HOME/.config/chezmoi/chezmoi.local.toml'" ~/.zshrc; then
          echo "Alias czcfg already exists in ~/.zshrc"
          exit 0
        fi
        CONFIG_FILE=~/.zshrc
        ;;
    *bash*)
        if grep -q "alias czcfg='chezmoi --config \\$HOME/.config/chezmoi/chezmoi.local.toml'" ~/.bashrc; then
          echo "Alias czcfg already exists in ~/.bashrc"
          exit 0
        fi 
        CONFIG_FILE=~/.bashrc
        ;;
    *fish*)
        if grep -q "alias czcfg='chezmoi --config \\$HOME/.config/chezmoi/chezmoi.local.toml'" ~/.config/fish/config.fish; then
          echo "Alias czcfg already exists in ~/.config/fish/config.fish"
          exit 0
        fi
        CONFIG_FILE=~/.config/fish/config.fish
        ;;
    *)
        echo "Unsupported shell. Please add the following alias to your shell configuration file:"
        echo "$ALIAS_LINE"
        exit 1
        ;;
    esac

echo "$ALIAS_LINE" >> "$CONFIG_FILE"
echo "Alias czcfg has been set up. Please restart your terminal or source your shell configuration file to use it."
