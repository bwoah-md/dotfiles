#!/usr/bin/env bash
PRIMARY="{{colors.primary.default.hex}}"
CONTAINER="{{colors.primary_container.default.hex}}"
COLOR="${PRIMARY:1}"
COLOR_DARK="${CONTAINER:1}"
THEME_NAME="Noctalia-Zafiro"
THEME_DIR="$HOME/.local/share/icons/$THEME_NAME"
BRANCH="color-${COLOR}-${COLOR_DARK}"

if git -C "$THEME_DIR" show-ref --quiet "refs/heads/$BRANCH"; then
    git -C "$THEME_DIR" checkout -q "$BRANCH"
else
    git -C "$THEME_DIR" checkout -q "original"
    git -C "$THEME_DIR" checkout -q -b "$BRANCH"
    
    # Zafiro usa #6f8a91 y #d8d8d8
    find "$THEME_DIR" -name "*.svg" -path "*/places/*" -type f -print0 | xargs -0 -P $(nproc) sed -i \
        -e "s/#6f8a91/#${COLOR_DARK}/gI" \
        -e "s/#d8d8d8/#${COLOR}/gI"
        
    git -C "$THEME_DIR" commit -q -am "color $BRANCH"
fi

gtk-update-icon-cache -f -t "$THEME_DIR" 2>/dev/null
CURRENT=$(gsettings get org.gnome.desktop.interface icon-theme | tr -d "'")
if [[ "$CURRENT" == "$THEME_NAME" ]]; then
    gsettings set org.gnome.desktop.interface icon-theme "hicolor" 2>/dev/null
    sleep 0.3
    gsettings set org.gnome.desktop.interface icon-theme "$THEME_NAME" 2>/dev/null
fi
