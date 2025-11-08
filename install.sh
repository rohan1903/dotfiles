#!/usr/bin/env bash

# create target dirs
mkdir -p ~/.theme

# link theme files
ln -sf ~/dotfiles/theme/colors ~/.theme/colors
ln -sf ~/dotfiles/theme/git ~/.theme/git

# link zshrc
ln -sf ~/dotfiles/zsh/zshrc ~/.zshrc

echo "✅ dotfiles linked"
echo "run: source ~/.zshrc"
