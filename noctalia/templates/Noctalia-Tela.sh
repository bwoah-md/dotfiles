
#!/usr/bin/env bash
PRI="{{colors.primary.default.hex}}"
C1="${PRI:1}"
THEME_NAME="Noctalia-Tela"
T_DIR="$HOME/.local/share/icons/$THEME_NAME"
BRANCH="color-${C1}"

# Initialize Git tracking if needed.
if [[ ! -d "$T_DIR/.git" ]]; then
    git -C "$T_DIR" init -q
    git -C "$T_DIR" add -A
    git -C "$T_DIR" commit -q -m "original"
    git -C "$T_DIR" tag "original"
    git -C "$T_DIR" checkout -q -b "original"
fi

if git -C "$T_DIR" show-ref --quiet "refs/heads/$BRANCH"; then
    git -C "$T_DIR" checkout -q "$BRANCH"
else
    git -C "$T_DIR" checkout -q "original"
    git -C "$T_DIR" checkout -q -b "$BRANCH"

    # Recolor place icons.
    find "$T_DIR" -name "*.svg" -path "*/places/*" -type f -print0 |
        xargs -0 -r -P "$(nproc)" sed -i \
            -e "s/\.ColorScheme-Highlight { color:#[0-9a-fA-F]\{6\}/\.ColorScheme-Highlight { color:#${C1}/gI" \
            -e "s/\.ColorScheme-Text { color:#[0-9a-fA-F]\{6\}/\.ColorScheme-Text { color:#${C1}/gI" \
            -e "s/fill=\"currentColor\"/fill=\"#${C1}\"/gI"

    git -C "$T_DIR" add -A
    git -C "$T_DIR" commit -q -m "$PRI"
fi

gtk-update-icon-cache -f -t "$T_DIR" 2>/dev/null || true

# Refresh the icon theme only if the GNOME schema is available.
if command -v gsettings >/dev/null 2>&1 &&
   gsettings list-schemas 2>/dev/null |
       grep -qx 'org.gnome.desktop.interface'; then

    CURRENT=$(gsettings get org.gnome.desktop.interface icon-theme 2>/dev/null |
        tr -d "'")

    if [[ "$CURRENT" == "$THEME_NAME" ]]; then
        gsettings set org.gnome.desktop.interface icon-theme "hicolor" 2>/dev/null || true
        sleep 0.2
        gsettings set org.gnome.desktop.interface icon-theme "$THEME_NAME" 2>/dev/null || true
    fi
fi

# Set the desktop folder icon where those paths exist.
gio set "$HOME/Escritorio" metadata::custom-icon-name "user-desktop" 2>/dev/null || true
gio set "$HOME/Desktop" metadata::custom-icon-name "user-desktop" 2>/dev/null || true
