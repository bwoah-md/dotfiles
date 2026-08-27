# icy@nix

Declarative NixOS flake configuration for `icy@nix` located directly in `~/.config/nixos`.

## Structure

```text
nixos/
├── flake.nix
├── flake.lock
├── hosts/nix/          # Hardware config & system entrypoint
├── modules/            # Modular system configurations
└── users/icy/          # User environment, declarative Zsh, aliases & git
```

---

## Fresh Machine Setup

### 1. Clone the repository

```bash
git clone [https://github.com/bwoah-md/dotfiles.git](https://github.com/bwoah-md/dotfiles.git) ~/.config/nixos
```

### 2. Generate Hardware Configuration & Build

```bash
# Generate hardware configuration for the target machine
sudo nixos-generate-config --show-hardware-config \
  > ~/.config/nixos/hosts/nix/hardware-configuration.nix

# Switch to the new system configuration
sudo nixos-rebuild switch --flake ~/.config/nixos#nix
```

### 3. Reboot / Re-log in

Restart your session to ensure all user services, declarative shell configs, and system packages start clean:

```bash
reboot
```

---

## Day-to-Day Workflow

All repository and system maintenance operations are managed using dedicated shell aliases:

### NixOS Git & Config Workflow
- **Stage changes:** `nixadd`
- **Commit changes:** `nixcommit "<commit message>"`
- **Push to GitHub:** `nixpush`
- **Pull remote changes:** `nixpull`
- **Status check:** `nixstatus`

### System Maintenance
- **Rebuild switch:** `nixrebuild`
- **Update flake inputs & rebuild:** `nixupdate`
- **Clean old generations:** `nixclean`

### Complete One-Shot Sync (`nixfrost`)
Runs a full flake input update, stages configuration changes, applies a system rebuild, cleans generational garbage, and pushes an automated commit to GitHub:

```bash
nixfrost
```
