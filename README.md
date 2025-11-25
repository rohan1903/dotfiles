# Dotfiles

Personal dotfiles configuration with an Ice + Rose color theme for zsh, git, and GNOME Terminal.

## Quick Start

### Installation

```bash
git clone https://github.com/rohan1903/dotfiles ~/dotfiles
cd ~/dotfiles
./install.sh
source ~/.zshrc
```

### Uninstallation

```bash
cd ~/dotfiles
./uninstall.sh
```

## Repository Structure

```
dotfiles/
├── install.sh                 # Main installation script
├── uninstall.sh               # Uninstallation script
├── apply-terminal-colors      # GNOME Terminal color applicator
├── README.md                  # This file
├── theme/                     # Theme configuration files
│   ├── colors                # 16-color palette definitions
│   ├── git                   # Git color theme variables
│   └── terminal              # GNOME Terminal palette format
└── zsh/                      # Zsh shell configuration
    └── zshrc                 # Main zsh config (linked to ~/.zshrc)
```

## File Descriptions

### `install.sh`
Main installation script that:
- Creates `~/.theme` directory
- Creates symlinks for configuration files
- Configures git colors globally
- Applies terminal color scheme (GNOME Terminal only)
- Safe to run multiple times (idempotent)

### `uninstall.sh`
Removes all symlinks created by the installation script. Does not revert git or terminal color settings.

### `apply-terminal-colors`
Script that applies the color scheme to GNOME Terminal using `gsettings`. Automatically detects the default terminal profile. Gracefully exits on non-GNOME systems.

### `theme/colors`
Defines the 16-color palette (Ice + Rose theme):
- Base colors: background, foreground, cursor
- Normal colors (0-7): black, red, green, yellow, blue, magenta, cyan, white
- Bright colors (8-15): brighter versions of normal colors

Sourced by `zsh/zshrc` at shell startup.

### `theme/git`
Git-specific color variables matching the theme:
- `GIT_ADDED`: Green for added files
- `GIT_CHANGED`: Yellow for modified files
- `GIT_UNTRACKED`: Rose pink for untracked files
- `GIT_DELETED`: Maroon for deleted files
- `GIT_BRANCH`: Cyan for branch names

Used by `install.sh` to configure git globally.

### `theme/terminal`
GNOME Terminal palette in the format required by `gsettings`. Contains the same colors as `theme/colors` but in GNOME Terminal's specific array format.

### `zsh/zshrc`
Main zsh configuration file that:
- Loads color palette from `~/.theme/colors`
- Sets up custom prompt: `⟶ ~/path (branch)`
- Configures zsh options (auto-cd, history sharing, etc.)
- Loads zsh-syntax-highlighting plugin if available
- Sets up OS-aware aliases (Linux/macOS compatible)
- Configures syntax highlighting colors
- Shows exit code on command failure

## Features

- **Ice + Rose Color Theme**: Consistent color scheme across shell, git, and terminal
- **Custom Zsh Prompt**: Shows current directory and git branch
- **Git Integration**: Color-coded git status and diffs
- **Cross-Platform**: Works on Linux and macOS
- **Idempotent Installation**: Safe to run install script multiple times
- **GNOME Terminal Support**: Automatic color scheme application

## Requirements

- Zsh shell
- Git (optional, for git color configuration)
- GNOME Terminal (optional, for automatic terminal color application)

## Troubleshooting

### Terminal colors not applied
- This script only works with GNOME Terminal
- On other terminals, colors will still work in zsh, but terminal background/foreground won't change
- You can manually configure your terminal's color scheme using the values in `theme/colors`

### Zsh syntax highlighting not working
- The script expects zsh-syntax-highlighting at `~/.zsh/zsh-syntax-highlighting/`
- Install it with: `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting`
- Or remove/comment out the relevant lines in `zsh/zshrc`

### Symlink conflicts
- If you have existing config files, the install script will back them up with a `.backup` extension
- Check for `~/.zshrc.backup` or `~/.theme/colors.backup` if needed

## Customization

To customize colors, edit the files in `theme/`:
- `theme/colors` - General color palette
- `theme/git` - Git-specific colors
- `theme/terminal` - Terminal palette (must match `colors`)

To customize zsh behavior, edit `zsh/zshrc`.

After making changes, re-run `./install.sh` to apply them.
