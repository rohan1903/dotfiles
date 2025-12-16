#!/usr/bin/env bash

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Function to create symlink with idempotency check
create_symlink() {
  local source="$1"
  local target="$2"
  local description="$3"

  # Check if target already exists
  if [ -L "$target" ]; then
    # Check if it points to the correct location
    local current_link="$(readlink "$target")"

    # Normalize source to absolute path
    local source_abs="$source"
    if [ "${source#/}" = "$source" ]; then
      # Source is relative, make it absolute
      source_abs="$(cd "$(dirname "$source")" 2>/dev/null && pwd)/$(basename "$source")"
    fi

    # Normalize current_link to absolute path if it's relative
    local current_link_abs="$current_link"
    if [ "${current_link#/}" = "$current_link" ] && [ -n "$current_link" ]; then
      # Current link is relative, resolve it relative to target's directory
      local target_dir="$(dirname "$target")"
      if [ -d "$target_dir" ]; then
        local resolved="$(cd "$target_dir" 2>/dev/null && cd "$(dirname "$current_link")" 2>/dev/null && pwd)/$(basename "$current_link")"
        [ -n "$resolved" ] && current_link_abs="$resolved"
      fi
    fi

    # Compare: check if paths match (try both absolute and original forms)
    if [ "$current_link_abs" = "$source_abs" ] || [ "$current_link" = "$source" ] || [ "$current_link" = "$source_abs" ]; then
      echo "✓ $description already linked correctly"
      return 0
    else
      echo "⚠️  $description exists but points elsewhere. Updating..."
      rm "$target"
    fi
  elif [ -e "$target" ]; then
    echo "⚠️  $description exists but is not a symlink. Backing up to ${target}.backup"
    mv "$target" "${target}.backup"
  fi

  # Create the symlink
  if ln -sf "$source" "$target"; then
    echo "✓ Linked $description"
  else
    echo "✗ Failed to link $description"
    return 1
  fi
}

echo "🚀 Installing dotfiles..."
echo ""

# Create theme directory
if [ ! -d ~/.theme ]; then
  mkdir -p ~/.theme
  echo "✓ Created ~/.theme directory"
else
  echo "✓ ~/.theme directory already exists"
fi

echo ""

# Link configuration files
create_symlink "$SCRIPT_DIR/zsh/zshrc" "$HOME/.zshrc" ".zshrc"
create_symlink "$SCRIPT_DIR/theme/colors" "$HOME/.theme/colors" "theme colors"
create_symlink "$SCRIPT_DIR/theme/git" "$HOME/.theme/git" "git theme"

echo ""

# Apply git palette
if [ -f "$SCRIPT_DIR/theme/git" ]; then
  source "$SCRIPT_DIR/theme/git"
  if command -v git &> /dev/null; then
    echo "📝 Configuring git colors..."
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
    echo "✓ Git colors configured"
  else
    echo "⚠️  git not found, skipping git color configuration"
  fi
else
  echo "⚠️  git theme file not found, skipping git configuration"
fi

echo ""

# Apply terminal palette
if [ -f "$SCRIPT_DIR/apply-terminal-colors" ]; then
  echo "🎨 Applying terminal colors..."
  "$SCRIPT_DIR/apply-terminal-colors"
else
  echo "⚠️  apply-terminal-colors script not found"
fi

echo ""
echo "✅ Installation complete!"
echo ""
echo "Next steps:"
echo "  1. Run: source ~/.zshrc"
echo "  2. Or open a new terminal window"
echo ""
echo "To uninstall, run: ./uninstall.sh"
