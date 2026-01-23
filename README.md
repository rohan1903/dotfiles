# Ice + Rose Theme

A refined dark terminal theme combining ice cyan, rose pink, and warm accents.

## Quick Start

```bash
git clone https://github.com/rohan1903/dotfiles ~/dotfiles
cd ~/dotfiles
./install.sh
source ~/.zshrc
```

To uninstall: `cd ~/dotfiles && ./uninstall.sh`

## Structure

```
dotfiles/
├── install.sh          # Installation script
├── uninstall.sh        # Uninstallation script
├── kitty/              # Kitty terminal config
├── theme/              # Color definitions
├── vim/                # Vim configuration
└── zsh/                # Zsh configuration
```

## Features

- Ice + Rose color palette (cyan, pink, gold, teal)
- Custom Zsh prompt with git branch
- Kitty terminal integration
- Git color configuration
- Vim configuration
- Syntax highlighting and colored file listings

## Color Palette

- **Ice Cyan**: `#8DD6F2` - Primary accent
- **Rose Pink**: `#EBBCBA` - Secondary accent
- **Warm Gold**: `#E3B34F` - Warnings
- **Leaf Green**: `#A7DCA2` - Success
- **Maroon**: `#A44A4A` - Errors

## Requirements

- Zsh
- Kitty (recommended) or compatible terminal
- zsh-syntax-highlighting (optional)

## Customization

Edit files in `theme/`, `zsh/zshrc`, `kitty/kitty.conf`, or `vim/vimrc`, then re-run `./install.sh`.

## Troubleshooting

- **Syntax highlighting not working**: Install `zsh-syntax-highlighting` at `~/.zsh/zsh-syntax-highlighting/`
- **Colors not appearing**: Run `./install.sh`, `source ~/.zshrc`, and restart your terminal
- **Symlink conflicts**: Existing files are backed up with `.backup` extension
