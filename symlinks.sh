#!/bin/sh

# Symlinks for all custom configurations
# ln -s <source_file> <symlink>

# .zsh
ln -s ~/.dotfiles/.zshrc ~/.zshrc

# NvChad - Custom Folder
ln -s ~/.dotfiles/.config/nvim/lua/custom ~/.config/nvim/lua/custom

# .vim
ln -s ~/.dotfiles/.vim ~/.vim
ln -s ~/.dotfiles/.vim/.vimrc ~/.vimrc

# tmux
ln -s ~/.dotfiles/.config/tmux ~/.config/tmux

# tmux source ~/.config/tmux/tmux.conf
