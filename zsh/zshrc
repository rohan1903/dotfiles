source ~/.theme/colors

# ---------- OPTIONS ----------
setopt AUTO_CD
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY
setopt PROMPT_SUBST

# ---------- COLORS (loaded from ~/.theme-colors) ----------
# using $BACKGROUND, $FOREGROUND, $CYAN, $PINK, $DIR, etc.

git_branch() {
  local branch=$(git symbolic-ref --short HEAD 2>/dev/null)
  [ -n "$branch" ] && echo "%F{$CYAN}($branch)%f"
}

# ---------- PROMPT ----------
PROMPT='%F{$DIR}%~%f $(git_branch) %F{$CYAN}⟶%f '

# ---------- PLUGINS ----------
# autosuggestions (disabled)
# source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# syntax highlighting
if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# ---------- ALIASES ----------
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -A'




