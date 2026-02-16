#!/bin/bash
# Author: tokiory
# Description:
# Computes which shell user is using and creates a czcfg alias for using chezmoi with the current config


echo "Current shell is: $SHELL"
echo "Setting up czcfg alias for using chezmoi with the current config..."

# Add check if alias already exists in the shell configuration file

case "$SHELL" in
    *zsh*)
        if grep -q "alias czcfg='chezmoi --source ~/.config/chezmoi'" ~/.zshrc; then
          echo "Alias czcfg already exists in ~/.zshrc"
          exit 0
        fi
        ;;
    *bash*)
        if grep -q "alias czcfg='chezmoi --source ~/.config/chezmoi'" ~/.bashrc; then
          echo "Alias czcfg already exists in ~/.bashrc"
          exit 0
        fi 
        ;;
    *fish*)
        if grep -q "alias czcfg='chezmoi --source ~/.config/chezmoi'" ~/.config/fish/config.fish; then
          echo "Alias czcfg already exists in ~/.config/fish/config.fish"
          exit 0
        fi
        ;;
    *)
        echo "Unsupported shell. Please add the following alias to your shell configuration file:"
        echo "alias czcfg='chezmoi --source ~/.config/chezmoi'"
        ;;
    esac

echo "Alias czcfg has been set up. Please restart your terminal or source your shell configuration file to use it."
