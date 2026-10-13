
#!/usr/bin/env bash
PRI="{{colors.primary.default.hex}}"
C1="${PRI:1}"
T_DIR="$HOME/.local/share/icons/Noctalia-Flat"
THEME_NAME="Noctalia-Flat"

BRANCH="color-${C1}"

if git -C "$T_DIR" show-ref --quiet "refs/heads/$BRANCH"; then
    git -C "$T_DIR" checkout -q "$BRANCH"
else
    git -C "$T_DIR" checkout -q "original"
    git -C "$T_DIR" checkout -q -b "$BRANCH"

    CONTAINER="{{colors.primary_container.default.hex}}"
    C_DARK="${CONTAINER:1}"

    # Precise color replacement.
    find "$T_DIR" -name "*.svg" -type f -print0 |
        xargs -0 -r -P "$(nproc)" sed -i -E \
            -e "s/367bf0/${C1}/gI" \
            -e "s/2b62c0/${C_DARK}/gI" \
            -e "s/357af0/${C1}/gI" \
            -e "s/8c42ab/${C_DARK}/gI"

    git -C "$T_DIR" commit -q -am "color $BRANCH"
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
