
#!/usr/bin/env bash
PRIMARY="{{colors.primary.default.hex}}"
SECONDARY="{{colors.secondary.default.hex}}"
COLOR="${PRIMARY:1}"
COLOR2="${SECONDARY:1}"
THEME_NAME="Noctalia-Papirus"
THEME_DIR="$HOME/.local/share/icons/$THEME_NAME"
BRANCH="color-${COLOR}-${COLOR2}"

CONTAINER="{{colors.primary_container.default.hex}}"
COLOR_DARK="${CONTAINER:1}"

if git -C "$THEME_DIR" show-ref --quiet "refs/heads/$BRANCH"; then
    git -C "$THEME_DIR" checkout -q "$BRANCH"
else
    git -C "$THEME_DIR" checkout -q "original"
    git -C "$THEME_DIR" checkout -q -b "$BRANCH"

    # Recolor place icons.
    find "$THEME_DIR" -name "*.svg" -path "*/places/*" -type f -print0 |
        xargs -0 -r -P "$(nproc)" sed -i \
            -e "s/fill:#5294e2/fill:#${COLOR}/gI" \
            -e "s/fill:#4877b1/fill:#${COLOR_DARK}/gI" \
            -e "s/fill:#1d344f/fill:#${COLOR_DARK}/gI" \
            -e "s/fill:#c9a554/fill:#${COLOR2}/gI" \
            -e "s/fill:#e4e4e4/fill:#${COLOR2}/gI" \
            -e "s/fill:#ffffff/fill:#${COLOR2}/gI"

    git -C "$THEME_DIR" commit -q -am "color $BRANCH"
fi

gtk-update-icon-cache -f -t "$THEME_DIR" 2>/dev/null || true

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
