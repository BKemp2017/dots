# ---- Shell opts
set -o notify
export EDITOR="nvim"
export USE_GKE_GCLOUD_AUTH_PLUGIN=True
export PATH="$HOME/.local/bin:$PATH"

# ---- fzf (if installed)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ---- starship prompt (if installed)
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

# ---- zoxide (optional; if installed)
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

# ---- Aliases
alias ll='ls -lah'
alias gs='git status'
alias gd='git diff'
alias gp='git pull --rebase --autostash && git push'
alias repos='cd ~/repos'
alias portal='cd ~/repos/portal'
