#!/usr/bin/env bash

# Install packer.nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Install Neovim
xcode-select --install
brew install --HEAD tree-sitter
brew install --HEAD luajit
brew install --HEAD neovim
