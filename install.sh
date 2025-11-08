#!/usr/bin/env bash

# create theme dir
mkdir -p ~/.theme

# link theme files
ln -sf ~/dotfiles/theme/colors ~/.theme/colors
ln -sf ~/dotfiles/theme/git ~/.theme/git

# link zshrc
ln -sf ~/dotfiles/zsh/zshrc ~/.zshrc

# apply git palette
source ~/dotfiles/theme/git
git config --global color.ui always
git config --global color.status.added       "$GIT_ADDED"
git config --global color.status.changed     "$GIT_CHANGED"
git config --global color.status.untracked   "$GIT_UNTRACKED"
git config --global color.status.deleted     "$GIT_DELETED"
git config --global color.branch.current     "$GIT_BRANCH"
git config --global color.branch.local       "$GIT_BRANCH"
git config --global color.branch.remote      "$GIT_BRANCH"
git config --global color.diff.new           "$GIT_ADDED"
git config --global color.diff.old           "$GIT_DELETED"
git config --global color.diff.meta          "$GIT_CHANGED"

# apply terminal palette
~/dotfiles/apply-terminal-colors

echo "✅ Everything applied!"
echo "Now run: source ~/.zshrc"
