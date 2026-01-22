# Ice + Rose Theme

A refined dark terminal theme combining ice cyan, rose pink, and warm accents for a comfortable development experience.

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
├── install.sh                 # Installation script
├── uninstall.sh               # Uninstallation script
├── README.md                  # This file
├── kitty/                     # Kitty terminal configuration
│   └── kitty.conf            # Color scheme and font settings
├── theme/                     # Theme color definitions
│   ├── colors                # 16-color palette (sourced by zsh)
│   ├── git                   # Git color variables
│   └── terminal              # GNOME Terminal palette (optional)
└── zsh/                      # Zsh shell configuration
    └── zshrc                 # Main zsh config
```

## Features

- **Ice + Rose Color Palette**: Ice cyan, rose pink, warm gold, and soft teal
- **Custom Zsh Prompt**: Clean prompt showing directory and git branch
- **Kitty Integration**: Terminal colors and font size configured
- **Git Colors**: Color-coded git status and diffs
- **Syntax Highlighting**: Zsh command highlighting with theme colors
- **LS Colors**: Colored file listings for `ls` and `tree`
- **Idempotent Installation**: Safe to run install script multiple times

## Color Palette

### Base Colors
- **Background**: `#1e1e1e` - Dark background
- **Foreground**: `#E6E7E9` - Soft white text
- **Cursor**: `#FFFFFF` - White cursor

### Accent Colors
- **Ice Cyan**: `#8DD6F2` / `#A0E2FF` - Primary accent (blue)
- **Rose Pink**: `#EBBCBA` / `#F1C3C1` - Secondary accent (magenta)
- **Soft Teal**: `#6EC6B8` / `#8FD8CC` - Cyan variant
- **Warm Gold**: `#E3B34F` / `#F5C85E` - Warnings and numbers
- **Leaf Green**: `#A7DCA2` / `#9DD097` - Success and strings
- **Maroon**: `#A44A4A` / `#C45F5F` - Errors

## Requirements

- **Zsh** - Shell configuration
- **Kitty** - Terminal emulator (recommended)
- **Git** - Optional, for git color configuration
- **zsh-syntax-highlighting** - Optional, for command highlighting

## Configuration Files

### `install.sh`
Main installation script that:
- Creates `~/.theme` directory
- Creates symlinks for configuration files
- Configures git colors globally
- Links Kitty config to `~/.config/kitty/kitty.conf`
- Safe to run multiple times (idempotent)

### `uninstall.sh`
Removes all symlinks created by the installation script. Does not revert git color settings.

### `theme/colors`
Defines the 16-color palette. Sourced by `zsh/zshrc` at shell startup.

### `theme/git`
Git-specific color variables used by `install.sh` to configure git globally.

### `theme/terminal`
GNOME Terminal palette format (optional, for GNOME Terminal users).

### `kitty/kitty.conf`
Kitty terminal configuration with:
- Font size: 13
- Complete color palette
- Selection colors

### `zsh/zshrc`
Zsh configuration with:
- Custom prompt: `⟶ ~/path (branch)`
- Zsh options (auto-cd, history sharing, etc.)
- Syntax highlighting colors
- LS_COLORS for `ls` and `tree`
- Exit code display on command failure
- NVM integration

## Customization

To customize colors, edit the files in `theme/`:
- `theme/colors` - General color palette
- `theme/git` - Git-specific colors
- `theme/terminal` - Terminal palette (must match `colors`)

To customize zsh behavior, edit `zsh/zshrc`.

To customize Kitty settings, edit `kitty/kitty.conf`.

After making changes, re-run `./install.sh` to apply them.

## Troubleshooting

### Zsh syntax highlighting not working
- The script expects zsh-syntax-highlighting at `~/.zsh/zsh-syntax-highlighting/`
- Install it with: `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting`
- Or remove/comment out the relevant lines in `zsh/zshrc`

### Symlink conflicts
- If you have existing config files, the install script will back them up with a `.backup` extension
- Check for `~/.zshrc.backup` or `~/.theme/colors.backup` if needed

### Colors not appearing
- Make sure you've run `./install.sh` and `source ~/.zshrc`
- Restart Kitty to apply terminal colors
- Verify color files are linked: `ls -la ~/.theme/colors`
