#!/usr/bin/env bash

echo "🗑️  Uninstalling Ice + Rose theme..."
echo ""

# Function to remove symlink safely
remove_symlink() {
  local target="$1"
  local description="$2"

  if [ -L "$target" ]; then
    rm "$target"
    echo "✓ Removed $description"
    return 0
  elif [ -e "$target" ]; then
    echo "⚠️  $description exists but is not a symlink. Skipping..."
    return 1
  else
    echo "○ $description not found (already removed?)"
    return 0
  fi
}

# Remove symlinks
remove_symlink "$HOME/.zshrc" ".zshrc"
remove_symlink "$HOME/.theme/colors" "theme colors"
remove_symlink "$HOME/.theme/git" "git theme"
remove_symlink "$HOME/.config/kitty/kitty.conf" "kitty config"
remove_symlink "$HOME/.config/fastfetch/config.jsonc" "fastfetch config"

echo ""

# Remove ~/.theme directory if it's empty
if [ -d ~/.theme ]; then
  # Check if directory is empty (no files, directories, or symlinks)
  if [ -z "$(find ~/.theme -mindepth 1 -maxdepth 1 2>/dev/null)" ]; then
    rmdir ~/.theme 2>/dev/null && echo "✓ Removed ~/.theme directory" || echo "○ ~/.theme directory not empty, keeping it"
  else
    echo "○ ~/.theme directory contains other files, keeping it"
  fi
fi

# Remove ~/.config/kitty if empty
if [ -d ~/.config/kitty ]; then
  if [ -z "$(find ~/.config/kitty -mindepth 1 -maxdepth 1 2>/dev/null)" ]; then
    rmdir ~/.config/kitty 2>/dev/null && echo "✓ Removed ~/.config/kitty directory" || echo "○ ~/.config/kitty directory not empty, keeping it"
  else
    echo "○ ~/.config/kitty directory contains other files, keeping it"
  fi
fi

echo ""
echo "✅ Uninstallation complete!"
echo ""
echo "Note: Git color configuration and terminal colors are not reverted."
echo "To revert git colors, run: git config --global --unset color.ui"
echo "Terminal colors will persist until manually changed."

