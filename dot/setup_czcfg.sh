#!/bin/bash
# Author: tokiory
# Description:
# Computes which shell user is using and creates a czcfg alias for using chezmoi with the current config


CURRENT_DIRECTORY=$(pwd)
CONFIG_FILE=""

echo "Current shell is: $SHELL"
echo "Current directory is: $CURRENT_DIRECTORY"
echo "Setting up czcfg alias for using chezmoi with the current config..."

case "$SHELL" in
    *zsh*)
        if grep -q "alias czcfg='chezmoi --source $CURRENT_DIRECTORY'" ~/.zshrc; then
          echo "Alias czcfg already exists in ~/.zshrc"
          exit 0
        fi
        CONFIG_FILE=~/.zshrc
        ;;
    *bash*)
        if grep -q "alias czcfg='chezmoi --source $CURRENT_DIRECTORY'" ~/.bashrc; then
          echo "Alias czcfg already exists in ~/.bashrc"
          exit 0
        fi 
        CONFIG_FILE=~/.bashrc
        ;;
    *fish*)
        if grep -q "alias czcfg='chezmoi --source $CURRENT_DIRECTORY'" ~/.config/fish/config.fish; then
          echo "Alias czcfg already exists in ~/.config/fish/config.fish"
          exit 0
        fi
        CONFIG_FILE=~/.config/fish/config.fish
        ;;
    *)
        echo "Unsupported shell. Please add the following alias to your shell configuration file:"
        echo "alias czcfg='chezmoi --source $CURRENT_DIRECTORY'"
        ;;
    esac

echo "alias czcfg='chezmoi --source $CURRENT_DIRECTORY'" >> $CONFIG_FILE
echo "Alias czcfg has been set up. Please restart your terminal or source your shell configuration file to use it."
