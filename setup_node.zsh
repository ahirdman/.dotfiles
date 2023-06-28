#!/bin/zsh

if exists node
then
  echo " - Node $(node -v) & NPM $(npm -v) already installed"
else
  echo " - Installing Node & NPM with n"
  n 18.10.0
fi
