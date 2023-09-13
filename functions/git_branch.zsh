#!/bin/zsh

BRANCH=$(git branch -v | gum choose |  awk '{print $1}')

git switch $BRANCH

