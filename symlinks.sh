#!/bin/sh

# Symlinks for all custom configurations
# lln -s <source_file> <symlink>

# .zsh
ln -s ~/.dotfiles/.zsh/.zshrc ~/.zshrc

# .nvim
ln -s ~/.dotfiles/.nvim/nvchad ~/.config/nvim
ln -s ~/.dotfiles/.nvim/nvchad-custom ~/.dotfiles/.nvim/nvchad/lua/custom

# .vim
ln -s ~/.dotfiles/.vim ~/.vim
ln -s ~/.dotfiles/.vim/.vimrc ~/.vimrc

# warp
ln -s ~/.dotfiles/.warp ~/.warp
