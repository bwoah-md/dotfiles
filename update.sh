#!/usr/bin/env bash

set -euo pipefail

DOTFILES="$HOME/.dotfiles"
CONFIG="$HOME/.config"

cd "$DOTFILES"

# qutebrowser — everything except noctalia/ and autoconfig.yml
rsync -a --delete \
  "$CONFIG/qutebrowser/bookmarks/" \
  qutebrowser/bookmarks/

rsync -a \
  "$CONFIG/qutebrowser/config.py" \
  "$CONFIG/qutebrowser/quickmarks" \
  qutebrowser/

rsync -a --delete \
  "$CONFIG/qutebrowser/greasemonkey/" \
  qutebrowser/greasemonkey/

rsync -a --delete \
  "$CONFIG/qutebrowser/startpage/" \
  qutebrowser/startpage/

rsync -a --delete \
  "$CONFIG/qutebrowser/styles/" \
  qutebrowser/styles/

# umbriel — everything except noctalia.toml
rsync -a --delete \
  "$CONFIG/umbriel/cfg/" \
  umbriel/cfg/

rsync -a \
  "$CONFIG/umbriel/config.toml" \
  umbriel/

rsync -a --delete \
  "$CONFIG/umbriel/shaders/" \
  umbriel/shaders/

# surge — themes only
rsync -a --delete \
  "$CONFIG/surge/themes/" \
  surge/themes/

# winapps
rsync -a \
  "$CONFIG/winapps/winapps.conf" \
  winapps/

# mpv — everything except shaders/
rsync -a --delete \
  "$CONFIG/mpv/fonts/" \
  mpv/fonts/

rsync -a \
  "$CONFIG/mpv/input.conf" \
  "$CONFIG/mpv/mpv.conf" \
  mpv/

rsync -a --delete \
  "$CONFIG/mpv/script-opts/" \
  mpv/script-opts/

rsync -a --delete \
  "$CONFIG/mpv/scripts/" \
  mpv/scripts/

# kitty — kitty.conf only
rsync -a \
  "$CONFIG/kitty/kitty.conf" \
  kitty/

# ghostty — config + shaders, NOT themes
rsync -a \
  "$CONFIG/ghostty/config.ghostty" \
  ghostty/

rsync -a --delete \
  "$CONFIG/ghostty/shaders/" \
  ghostty/shaders/

# helix — config.toml only
rsync -a \
  "$CONFIG/helix/config.toml" \
  helix/

# foot — foot.ini only
rsync -a \
  "$CONFIG/foot/foot.ini" \
  foot/

# fetch
rsync -a \
  "$CONFIG/fetch/config" \
  fetch/

# fastfetch — config + nixos-small, NOT themes
rsync -a \
  "$CONFIG/fastfetch/config.jsonc" \
  "$CONFIG/fastfetch/nixos-small.txt" \
  fastfetch/

# concord — config/keymap/theme, NOT concord.log
rsync -a \
  "$CONFIG/concord/config.toml" \
  "$CONFIG/concord/keymap.toml" \
  "$CONFIG/concord/theme.toml" \
  concord/

# equibop — only these two files
rsync -a \
  "$CONFIG/equibop/settings/quickCss.css" \
  "$CONFIG/equibop/settings/settings.json" \
  equibop/settings/

# zed — settings only
rsync -a \
  "$CONFIG/zed/settings.json" \
  zed/

echo "Dotfiles updated from ~/.config"
