#!/usr/bin/env bash
set -euo pipefail

config_dir="${XDG_CONFIG_HOME:-$HOME/.config}/labwc"
source_theme="$config_dir/noctalia.conf"

get_color() {
    local key="$1"
    local val

    val=$(grep "^$key:" "$source_theme" | awk '{print $2}' || true)

    if [ -z "$val" ]; then
        echo "labnag: missing color: $key" >&2
        exit 1
    fi

    echo "${val#\#}"
}

C_BACKGROUND=$(get_color "window.active.title.bg.color")
C_TEXT=$(get_color "osd.label.text.color")
C_PRIMARY=$(get_color "window.active.border.color")
C_TERTIARY=$(get_color "menu.title.text.color")

FONT="monospace 11"

exec labnag \
    --message "$1" \
    --button-dismiss "$2" \
    --button-dismiss "$3" \
    --background-color "$C_BACKGROUND" \
    --text-color "$C_TEXT" \
    --button-border-color "$C_TERTIARY" \
    --border-bottom-color "$C_PRIMARY" \
    --button-background-color "$C_BACKGROUND" \
    --button-text-color "$C_PRIMARY" \
    --border-bottom-size 1 \
    --button-border-size 0 \
    --message-padding 10 \
    --button-padding 10 \
    --button-gap 8 \
    --button-dismiss-gap 8 \
    --button-margin-right 8 \
    --keyboard-focus on-demand \
    --layer overlay \
    --timeout 0 \
    --font "$FONT"
