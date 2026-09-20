#!/usr/bin/env bash
set -euo pipefail

config_dir="${XDG_CONFIG_HOME:-$HOME/.config}/labwc"
config_file="$config_dir/rc.xml"
theme_file="$config_dir/noctalia.conf"
openbox_theme_dir="${XDG_DATA_HOME:-$HOME/.local/share}/themes/noctalia/openbox-3"
openbox_theme="$openbox_theme_dir/themerc"

if [ -f "$config_file" ]; then
    tmp_file="$(mktemp "${config_file}.tmp.XXXXXX")"
    trap 'rm -f "$tmp_file"' EXIT
    awk '!/<name>[[:space:]]*noctalia[[:space:]]*<\/name>/' "$config_file" >"$tmp_file"
    if ! cmp -s "$config_file" "$tmp_file"; then
        cat "$tmp_file" >"$config_file"
    fi
fi

rm -f -- "$theme_file" "$openbox_theme"
rm -f -- "$openbox_theme_dir"/*.svg
