# Created by newuser for 5.9.2

# ─────────────────────────────────────────────
# Dotfiles
# ─────────────────────────────────────────────

alias dot='cd ~/.dotfiles'

alias dotstatus='git -C ~/.dotfiles status'
alias dotdiff='git -C ~/.dotfiles diff'
alias dotadd='git -C ~/.dotfiles add -A'
alias dotpush='git -C ~/.dotfiles push'
alias dotlog='git -C ~/.dotfiles log --oneline --decorate --graph'
alias dotremote='git -C ~/.dotfiles remote -v'
alias dotrestore='cp -r ~/.dotfiles/* ~/.config/ && cp ~/.dotfiles/.zshrc ~/.zshrc'

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
