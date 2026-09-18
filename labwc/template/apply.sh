#!/usr/bin/env bash
set -euo pipefail

config_dir="${XDG_CONFIG_HOME:-$HOME/.config}/labwc"
template_dir="$config_dir/template"
theme_dir="${XDG_DATA_HOME:-$HOME/.local/share}/themes/noctalia/openbox-3"
theme_file="$theme_dir/themerc"
source_theme="$config_dir/noctalia.conf"
rc_file="$config_dir/rc.xml"

mkdir -p "$config_dir" "$theme_dir"

if [ -f "$source_theme" ]; then
    cp -f "$source_theme" "$theme_file"
fi

# -- GENERATE DYNAMIC SVGS --
if [ -f "$source_theme" ]; then
    # Extract dynamic colors from the generated noctalia config
    get_color() {
        local key="$1" fallback="$2"
        local val
        val=$(grep "^$key:" "$source_theme" | awk '{print $2}' || true)
        if [ -n "$val" ]; then
            echo "$val"
        else
            echo "$fallback"
        fi
    }

    C_CLOSE=$(get_color "_meta.btn.close" "#FF5F56")
    C_MIN=$(get_color "_meta.btn.min" "#FFBD2E")
    C_MAX=$(get_color "_meta.btn.max" "#27C93F")
    C_INACT=$(get_color "_meta.btn.inactive" "#4D4D4D")

    C_PRIMARY=$(get_color "window.active.border.color" "#7AA2F7")

    # Insert snapping overlay colors
    echo "snapping.overlay.region.bg.color: ${C_MAX} 40" >> "$theme_file"
    echo "snapping.overlay.edge.bg.color: ${C_MAX} 40" >> "$theme_file"
    echo "snapping.overlay.region.border.color: ${C_MAX}" >> "$theme_file"
    echo "snapping.overlay.edge.border.color: ${C_MAX}" >> "$theme_file"

    # We remove the _meta variables from the final themerc as Openbox might complain
    sed -i '/^_meta.btn/d' "$theme_file" || true

    create_square_svg() {
        local file="$1"
        local color="$2"
        cat <<EOF > "$theme_dir/$file"
<svg width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
  <rect x="7" y="7" width="10" height="10" fill="$color"/>
</svg>
EOF
    }

    create_primary_icon() {
        local source="$1"
        local target="$2"

        sed \
            -e "s/stroke=\"currentColor\"/stroke=\"$C_PRIMARY\"/g" \
            -e "s/fill=\"currentColor\"/fill=\"$C_PRIMARY\"/g" \
            -e "s/fill=\"black\"/fill=\"$C_PRIMARY\"/g" \
            "$config_dir/icons/$source" > "$theme_dir/$target"
    }

    # Menu icons (Primary)
    create_primary_icon "terminal.svg" "terminal.svg"
    create_primary_icon "explorer.svg" "explorer.svg"
    create_primary_icon "zed.svg" "zed.svg"
    create_primary_icon "reload-1.svg" "reload-1.svg"
    create_primary_icon "reload-2.svg" "reload-2.svg"
    create_primary_icon "wallpaper.svg" "wallpaper.svg"
    create_primary_icon "settings.svg" "settings.svg"
    create_primary_icon "logout.svg" "logout.svg"

    # Client menu icons (Primary)
    create_primary_icon "minimize.svg" "minimize.svg"
    create_primary_icon "maximize.svg" "maximize.svg"
    create_primary_icon "fullscreen.svg" "fullscreen.svg"
    create_primary_icon "alwaysontop.svg" "alwaysontop.svg"
    create_primary_icon "close.svg" "close.svg"

    # Close (Error)
    create_square_svg "close-active.svg" "$C_CLOSE"
    create_square_svg "close_hover-active.svg" "$C_CLOSE" # Using identical for hover as requested
    create_square_svg "close-inactive.svg" "$C_INACT"
    create_square_svg "close_hover-inactive.svg" "$C_INACT"

    # Maximize (Primary)
    create_square_svg "max-active.svg" "$C_MAX"
    create_square_svg "max_hover-active.svg" "$C_MAX"
    create_square_svg "max-inactive.svg" "$C_INACT"
    create_square_svg "max_hover-inactive.svg" "$C_INACT"

    # Toggled Maximize
    create_square_svg "max_toggled-active.svg" "$C_MAX"
    create_square_svg "max_toggled_hover-active.svg" "$C_MAX"
    create_square_svg "max_toggled-inactive.svg" "$C_INACT"
    create_square_svg "max_toggled_hover-inactive.svg" "$C_INACT"

    # Minimize (Secondary)
    create_square_svg "iconify-active.svg" "$C_MIN"
    create_square_svg "iconify_hover-active.svg" "$C_MIN"
    create_square_svg "iconify-inactive.svg" "$C_INACT"
    create_square_svg "iconify_hover-inactive.svg" "$C_INACT"
fi

write_if_changed() {
    local target="$1" tmp="$2"
    if [ ! -e "$target" ] && [ ! -L "$target" ]; then
        mv "$tmp" "$target"
        return
    fi
    if ! cmp -s "$target" "$tmp"; then
        cat "$tmp" >"$target"
    fi
    rm -f "$tmp"
}

if [ ! -f "$rc_file" ]; then
    cat >"$rc_file" <<'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<labwc_config>
  <theme>
    <name>noctalia</name>
  </theme>
</labwc_config>
EOF
    exit 0
fi

tmp_file="$(mktemp "${rc_file}.tmp.XXXXXX")"
trap 'rm -f "$tmp_file"' EXIT

if grep -q '<theme>' "$rc_file"; then
    if ! grep -q '</theme>' "$rc_file"; then
        echo "Cannot update Labwc theme: $rc_file contains <theme> without </theme>" >&2
        exit 1
    fi

    if sed -n '/<theme>/,/<\/theme>/ {
        /<font[[:space:]>].*<\/font>/d
        /<font[[:space:]>]/,/<\/font>/d
        /<name>.*<\/name>/p
    }' "$rc_file" | grep -q .; then
        sed '/<theme>/,/<\/theme>/ {
            /<font[[:space:]>].*<\/font>/b
            /<font[[:space:]>]/,/<\/font>/b
            s|<name>.*</name>|<name>noctalia</name>|
        }' "$rc_file" >"$tmp_file"
    else
        sed '/<theme>/a\    <name>noctalia</name>' "$rc_file" >"$tmp_file"
    fi
else
    if ! grep -qE '<labwc_config([[:space:]>])' "$rc_file"; then
        echo "Cannot update Labwc theme: $rc_file does not contain <labwc_config>" >&2
        exit 1
    fi

    sed '/<labwc_config[[:space:]>]/a\  <theme>\n    <name>noctalia</name>\n  </theme>' "$rc_file" >"$tmp_file"
fi

trap - EXIT
write_if_changed "$rc_file" "$tmp_file"

# Reconfigure LabWC when the theme changes.
if pgrep -x labwc >/dev/null; then
    labwc --reconfigure
fi
