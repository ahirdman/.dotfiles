#!/bin/zsh

if exists rustup
then
  echo " - Rust $(rustup -V) & cargo $(cargo -V) already installed"
else
  echo " - Installing Rust & Cargo"
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi
