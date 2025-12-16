#!/usr/bin/env bash

#############################################
# COLOR TEST SCRIPT FOR DARK THEME
#############################################

echo "=========================================="
echo "  DARK THEME COLOR TEST"
echo "=========================================="
echo ""

echo "1. 16-COLOR PALETTE TEST"
echo "------------------------"
echo -e "\033[30mColor 0 (Black):     \033[0m Normal black"
echo -e "\033[31mColor 1 (Red):       \033[0m Muted red"
echo -e "\033[32mColor 2 (Green):    \033[0m Muted green"
echo -e "\033[33mColor 3 (Yellow):    \033[0m Muted orange"
echo -e "\033[34mColor 4 (Blue):      \033[0m Muted blue"
echo -e "\033[35mColor 5 (Magenta):   \033[0m Muted pink"
echo -e "\033[36mColor 6 (Cyan):      \033[0m Muted cyan"
echo -e "\033[37mColor 7 (White):     \033[0m Light gray"
echo ""
echo -e "\033[90mColor 8 (Bright Black):  \033[0m Slightly lighter"
echo -e "\033[91mColor 9 (Bright Red):    \033[0m Brighter muted red"
echo -e "\033[92mColor 10 (Bright Green):  \033[0m Brighter muted green"
echo -e "\033[93mColor 11 (Bright Yellow): \033[0m Brighter muted orange"
echo -e "\033[94mColor 12 (Bright Blue):   \033[0m Brighter muted blue"
echo -e "\033[95mColor 13 (Bright Magenta):\033[0m Brighter muted pink"
echo -e "\033[96mColor 14 (Bright Cyan):   \033[0m Brighter muted cyan"
echo -e "\033[97mColor 15 (Bright White):  \033[0m Brighter light gray"
echo ""

echo "2. LS COLORS TEST"
echo "-----------------"
echo "Run: ls --color=auto"
echo "This will show colored file listings using the theme colors"
echo ""

echo "3. GIT COLORS TEST"
echo "------------------"
echo "To test git colors, try these commands in a git repository:"
echo "  git status                    # Shows added/changed/untracked/deleted files"
echo "  git diff                     # Shows diff colors"
echo "  git log --oneline --graph    # Shows branch colors"
echo ""

echo "4. ZSH SYNTAX HIGHLIGHTING TEST"
echo "-------------------------------"
echo "Type these commands to see syntax highlighting:"
echo "  ls -la /home                  # Valid command (green), flags (cyan), path (orange)"
echo "  invalid_command               # Invalid command (red)"
echo "  echo 'hello world'            # Quoted argument (pink)"
echo "  cat file.txt                 # Command (green), path (orange)"
echo ""

echo "5. PROMPT COLORS TEST"
echo "--------------------"
echo "Your prompt should show:"
echo "  ⟶ (muted cyan arrow)"
echo "  ~/path (muted blue directory)"
echo "  (branch) (muted pink git branch if in git repo)"
echo ""

echo "6. EXIT CODE TEST"
echo "-----------------"
echo "Run a failing command to see exit code in red:"
echo "  false                         # Should show: ✗ exit: 1"
echo ""

echo "7. COLORED OUTPUT TEST"
echo "----------------------"
echo -e "Testing \033[32mgreen\033[0m, \033[31mred\033[0m, \033[33morange\033[0m, \033[34mblue\033[0m, \033[35mpink\033[0m, \033[36mcyan\033[0m colors"
echo ""

echo "8. COMPREHENSIVE TEST COMMANDS"
echo "------------------------------"
cat << 'EOF'
# Test all colors at once:
echo -e "\033[30mBlack\033[0m \033[31mRed\033[0m \033[32mGreen\033[0m \033[33mOrange\033[0m \033[34mBlue\033[0m \033[35mPink\033[0m \033[36mCyan\033[0m \033[37mWhite\033[0m"
echo -e "\033[90mBright Black\033[0m \033[91mBright Red\033[0m \033[92mBright Green\033[0m \033[93mBright Orange\033[0m \033[94mBright Blue\033[0m \033[95mBright Pink\033[0m \033[96mBright Cyan\033[0m \033[97mBright White\033[0m"

# Test with background:
echo -e "\033[40;37mBlack bg, White fg\033[0m"
echo -e "\033[41;37mRed bg, White fg\033[0m"
echo -e "\033[42;30mGreen bg, Black fg\033[0m"
echo -e "\033[43;30mOrange bg, Black fg\033[0m"
echo -e "\033[44;37mBlue bg, White fg\033[0m"
echo -e "\033[45;30mPink bg, Black fg\033[0m"
echo -e "\033[46;30mCyan bg, Black fg\033[0m"
EOF

echo ""
echo "=========================================="
echo "  Run this script with: bash test-colors.sh"
echo "=========================================="

