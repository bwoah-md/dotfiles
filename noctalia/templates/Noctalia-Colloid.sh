#!/usr/bin/env bash
PRI="{{colors.primary.default.hex}}"
C1="${PRI:1}"
T_DIR="$HOME/.local/share/icons/Noctalia-Colloid"

BRANCH="color-${C1}"
if git -C "$T_DIR" show-ref --quiet "refs/heads/$BRANCH"; then
    git -C "$T_DIR" checkout -q "$BRANCH"
else
    git -C "$T_DIR" checkout -q "original"
    git -C "$T_DIR" checkout -q -b "$BRANCH"
    
    # Reemplazo de color maestro multihilo
    find "$T_DIR" -name "*.svg" -type f -print0 | xargs -0 -P $(nproc) sed -i -E \
        -e "s/#60c0f0/#${C1}/gI" \
        -e "s/#5294e2/#${C1}/gI" \
        -e "s/fill:#[0-9a-fA-F]{6}/fill:#${C1}/gI" \
        -e "s/stop-color:#[0-9a-fA-F]{6}/stop-color:#${C1}/gI" \
        -e "s/style=\"fill:#[0-9a-fA-F]{6}/style=\"fill:#${C1}/gI" \
        -e "s/currentColor/#${C1}/gI"
        
    git -C "$T_DIR" commit -q -am "color $BRANCH"
fi

gtk-update-icon-cache -f -t "$T_DIR" 2>/dev/null
CURRENT=\$(gsettings get org.gnome.desktop.interface icon-theme | tr -d "'")
if [[ "\$CURRENT" == "Noctalia-Colloid" ]]; then
    gsettings set org.gnome.desktop.interface icon-theme "hicolor" 2>/dev/null
    sleep 0.2
    gsettings set org.gnome.desktop.interface icon-theme "Noctalia-Colloid" 2>/dev/null
fi
