# icy@nix

Declarative NixOS flake configuration for `icy@nix`, located directly in `~/.config/nixos`.

## Structure

```text
nixos/
├── flake.nix
├── flake.lock
├── hosts/nix/          # Hardware config & system entrypoint
├── modules/            # Modular system configurations & custom packages
└── users/icy/          # User environment, declarative Zsh, aliases & git
```

---

## Fresh Machine Setup

### 1. Clone the repository

```bash
git clone https://github.com/bwoah-md/nixbtw.git ~/.config/nixos
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

All repository and system maintenance operations are managed using dedicated shell aliases and functions.

### NixOS Git & Config Workflow

* **Stage changes:** `nixadd`
* **Commit changes:** `nixcommit "<commit message>"`
* **Push to GitHub:** `nixpush`
* **Pull remote changes:** `nixpull`
* **Status check:** `nixstatus`

### Package & Flake Updates

* **Update custom packages:** `nixupdate`

  * Updates `swash`
  * Updates `superseedr`
  * Updates `ghosttime`
* **Update flake inputs:** `nixflake`

### System Maintenance

* **Rebuild and switch:** `nixrebuild`
* **Clean old generations:** `nixclean`

### Complete One-Shot Sync (`nixfrost`)

Runs the complete maintenance workflow:

1. Updates flake inputs
2. Stages configuration changes
3. Rebuilds and switches the NixOS system
4. Removes old Nix generations
5. Commits the changes automatically
6. Pushes the commit to GitHub

```bash
nixfrost
```

---

## Custom Packages

The configuration maintains a small set of packages that are not being consumed directly from nixpkgs:

* **Swash** — built from its upstream GitHub repository
* **Superseedr** — built from its upstream Rust source using Nix's `buildRustPackage`
* **Ghosttime** — packaged from its upstream npm release

The custom packages are consolidated under:

```text
modules/packages/custom.nix
```

Individual package definitions remain in:

```text
modules/packages/custom/
├── swash.nix
├── superseedr.nix
└── ghosttime.nix
```

`cliamp` is provided directly by nixpkgs and therefore does not belong in the custom package definitions.

---

## Useful Commands

```bash
# Check repository state
nixstatus

# Update custom packages
nixupdate

# Update flake inputs
nixflake

# Rebuild the system
nixrebuild

# Clean old generations
nixclean

# Full maintenance workflow
nixfrost
```
