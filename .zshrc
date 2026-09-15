# Created by newuser for 5.9.2

# ─────────────────────────────────────────────
# Dotfiles
# ─────────────────────────────────────────────

alias dot='cd ~/.dotfiles'

alias dot-status='git -C ~/.dotfiles status'
alias dot-diff='git -C ~/.dotfiles diff'
alias dot-add='git -C ~/.dotfiles add -A'
alias dot-push='git -C ~/.dotfiles push'
alias dot-log='git -C ~/.dotfiles log --oneline --decorate --graph'
alias dot-remote='git -C ~/.dotfiles remote -v'

dotfrost() {
    local repo="$HOME/.dotfiles"
    local message

    echo "==> Staging dotfiles..."
    git -C "$repo" add -A

    echo
    echo "==> Changes staged:"
    git -C "$repo" status --short

    echo
    echo "==> Staged diff:"
    git -C "$repo" diff --cached

    echo
    read "message?Commit message: "

    if [[ -z "$message" ]]; then
        echo "No commit message supplied. Aborting."
        return 1
    fi

    echo
    echo "==> Creating commit..."
    git -C "$repo" commit -m "$message"
}
