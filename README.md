# Shared configurations

### Includes:

- ZSHrc file
- Vimrc & vim plug
- Raycast data & settings
- Warp Worklfows

### Packages:

- Nerd Fonts for icons
  - Install via curl and set in terminal
- Starship
- Vim-plug

## Links:

- Vimrc setuo:
- https://www.freecodecamp.org/news/vimrc-configuration-guide-customize-your-vim-editor/

## Symlinks needed:

### ZSH

Create a symlink from $Home/~ to the `.zshrc` in this repo

### Warp

Create a symlink from $Home/~ to `.warp` folder in this repo

### Vim

Create a symlink from $Home/~ to `.vim` folder in this repo
Create another link for the rc fie in the `.vim` folder

## Notes

In the `plugged` folder under `.vim` folder, there are a number of repositories for the vim plug package manager. Most are still tracked but the ale plug is not.

## Scripts to execute

ln -s ~/.dotfiles/.vim ~/.vim
ln -s ~/.dotfiles/.vim/.vimrc ~/.vimrc
ln -s ~/.dotfiles/.zsh/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.warp ~/.warp
