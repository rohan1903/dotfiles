# Color Testing Commands

Use these commands to test all colors in your dark theme after applying it.

## Quick Test Script

Run the test script:
```bash
./test-colors.sh
```

## Manual Color Tests

### 1. Test 16-Color Palette

```bash
# Normal colors (0-7)
echo -e "\033[30mColor 0: Black\033[0m"
echo -e "\033[31mColor 1: Red (muted)\033[0m"
echo -e "\033[32mColor 2: Green (muted)\033[0m"
echo -e "\033[33mColor 3: Orange (muted)\033[0m"
echo -e "\033[34mColor 4: Blue (muted)\033[0m"
echo -e "\033[35mColor 5: Pink (muted)\033[0m"
echo -e "\033[36mColor 6: Cyan (muted)\033[0m"
echo -e "\033[37mColor 7: White (light gray)\033[0m"

# Bright colors (8-15)
echo -e "\033[90mColor 8: Bright Black\033[0m"
echo -e "\033[91mColor 9: Bright Red\033[0m"
echo -e "\033[92mColor 10: Bright Green\033[0m"
echo -e "\033[93mColor 11: Bright Orange\033[0m"
echo -e "\033[94mColor 12: Bright Blue\033[0m"
echo -e "\033[95mColor 13: Bright Pink\033[0m"
echo -e "\033[96mColor 14: Bright Cyan\033[0m"
echo -e "\033[97mColor 15: Bright White\033[0m"
```

### 2. Test All Colors at Once

```bash
echo -e "\033[30mBlack\033[0m \033[31mRed\033[0m \033[32mGreen\033[0m \033[33mOrange\033[0m \033[34mBlue\033[0m \033[35mPink\033[0m \033[36mCyan\033[0m \033[37mWhite\033[0m"
echo -e "\033[90mBright Black\033[0m \033[91mBright Red\033[0m \033[92mBright Green\033[0m \033[93mBright Orange\033[0m \033[94mBright Blue\033[0m \033[95mBright Pink\033[0m \033[96mBright Cyan\033[0m \033[97mBright White\033[0m"
```

### 3. Test Background Colors

```bash
echo -e "\033[40;37mBlack background\033[0m"
echo -e "\033[41;37mRed background\033[0m"
echo -e "\033[42;30mGreen background\033[0m"
echo -e "\033[43;30mOrange background\033[0m"
echo -e "\033[44;37mBlue background\033[0m"
echo -e "\033[45;30mPink background\033[0m"
echo -e "\033[46;30mCyan background\033[0m"
```

### 4. Test LS Colors

```bash
# Create test files with different types
mkdir -p /tmp/color-test && cd /tmp/color-test
touch file.txt script.sh
chmod +x script.sh
ln -s file.txt symlink.txt
mkdir dir

# View with colors
ls -la --color=auto

# Cleanup
cd ~
rm -rf /tmp/color-test
```

### 5. Test Git Colors

```bash
# Navigate to a git repository (or create a test one)
cd /tmp
git init color-test-repo
cd color-test-repo

# Create files to test different git states
echo "content" > added.txt
echo "modified" > modified.txt
echo "deleted" > deleted.txt

git add added.txt
git commit -m "Initial commit"

echo "new content" >> modified.txt
rm deleted.txt
touch untracked.txt

# Test git status colors
git status

# Test git diff colors
git diff

# Test git log with branch colors
git log --oneline --graph --all --decorate

# Cleanup
cd ~
rm -rf /tmp/color-test-repo
```

### 6. Test ZSH Syntax Highlighting

Type these commands in your terminal (don't run them all at once):

```bash
# Valid command (should be green)
ls -la /home

# Invalid command (should be red)
invalid_command_that_does_not_exist

# Command with flags (flags should be cyan)
ls -la --color=auto /home/user

# Command with path (path should be orange)
cat /home/user/file.txt

# Command with quoted argument (quotes should be pink)
echo "hello world"
grep "pattern" file.txt
```

### 7. Test Prompt Colors

Your prompt should show:
- **Arrow (⟶)**: Muted cyan
- **Directory (~/path)**: Muted blue
- **Git branch (branch)**: Muted pink (if in git repo)

Navigate to different directories and git repos to see the prompt change:
```bash
cd ~
cd /tmp
cd ~/dotfiles  # If this is a git repo, you'll see the branch name
```

### 8. Test Exit Code Display

```bash
# Run a failing command
false
# Should show: ✗ exit: 1 in muted red

# Run a successful command
true
# Should show nothing (exit code 0)
```

### 9. Test with Common Commands

```bash
# Grep with colors
echo -e "line1\nline2\nline3" | grep --color=auto "line"

# Tree with colors (if installed)
tree -C

# Git log with colors
git log --graph --pretty=format:'%C(yellow)%h%Creset -%C(red)%d%Creset %s %C(green)(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit

# Man pages (if colored)
man ls
```

### 10. Comprehensive Color Test

Run this single command to see all colors:

```bash
echo -e "\033[30m█\033[0m\033[31m█\033[0m\033[32m█\033[0m\033[33m█\033[0m\033[34m█\033[0m\033[35m█\033[0m\033[36m█\033[0m\033[37m█\033[0m \033[90m█\033[0m\033[91m█\033[0m\033[92m█\033[0m\033[93m█\033[0m\033[94m█\033[0m\033[95m█\033[0m\033[96m█\033[0m\033[97m█\033[0m"
echo "Black Red Green Orange Blue Pink Cyan White | Bright versions"
```

## Expected Colors

- **Background**: Very dark gray (#0A0A0A) - almost black
- **Text**: Light gray (#D0D0D0)
- **Red**: Muted red (#D75F5F) - for errors
- **Green**: Muted green (#87AF87) - for success
- **Orange**: Muted orange (#D7875F) - for warnings/numbers
- **Blue**: Muted blue (#5F87AF) - primary accent
- **Pink**: Muted pink (#D787AF) - secondary accent (git branch)
- **Cyan**: Muted cyan (#5FAFAF) - cursor and arrows

## Troubleshooting

If colors don't appear:
1. Make sure you've run `./install.sh` and `source ~/.zshrc`
2. Check that your terminal supports 256 colors: `echo $TERM`
3. For GNOME Terminal, run `./apply-terminal-colors` to apply terminal colors
4. Verify color files are linked: `ls -la ~/.theme/colors`

