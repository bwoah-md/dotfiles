# qutebrowser setup for icy@nix

## Installation

1. Copy the contents of this directory to `~/.config/qutebrowser`.
2. Restart qutebrowser.

## Limitations

1. Scripts for qutebrowser in [~/.config/noctalia/templates.toml](https://github.com/bwoah-md/dotfiles/blob/main/noctalia/templates.toml) might need to change according to your OS and how it interacts with the qutebrowser IPC calls...
> put the file below in this **dir.:** `~/.local/state/noctalia/community-templates/qutebrowser/reload.sh`

```bash
#!/bin/sh

COLORS_FILE="${XDG_CONFIG_HOME:-$HOME/.config}/qutebrowser/noctalia/colors.py"

[ "$COLORS_FILE" -nt "$0" ] || exit 0
touch "$0"

RUNTIME_DIR="${XDG_RUNTIME_DIR:-/tmp}/qutebrowser"
ls "$RUNTIME_DIR"/ipc-* >/dev/null 2>&1 && qutebrowser :config-source
```

```bash
chmod +x ~/.local/state/noctalia/community-templates/qutebrowser/reload.sh
```

This works for my nix setup, might break on yours...
