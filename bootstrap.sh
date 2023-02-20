#!/usr/bin/env bash

if [[ -z "$DOTFILES" ]]; then
  echo "Ensure path to dotfiles, '\$DOTFILES', is set."
  exit 1
fi

if [[ ! -d "$HOME/.config" ]]; then
  mkdir "$HOME/.config"
fi

# Symlinks for dotfiles
ln -s "$DOTFILES/nvim" "$HOME/.config/nvim"
