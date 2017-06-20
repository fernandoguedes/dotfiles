#!/usr/bin/env bash

printf "\n=> Configuring Git\n"

ln -F -s ~/.dotfiles/git/.gitconfig.local ~/.gitconfig.local
ln -F -s ~/.dotfiles/git/.gitignore.global ~/.gitignore.global

git config --global include.path "~/.gitconfig.local"
git config --global core.excludesile "~/.gitignore.global"
