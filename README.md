# icy@dotfiles

Personal configuration files maintained separately from the NixOS system configuration.

The live configurations remain in their normal locations under `~/.config`. This repository is a **manual copy-based backup and version-control repository** — no symlinks and no automatic synchronization.

## Structure

```text
.dotfiles/
├── .zshrc
├── concord/
├── equibop/
├── fastfetch/
├── fetch/
├── foot/
├── ghostty/
├── helix/
├── kitty/
├── mpv/
├── qutebrowser/
├── umbriel/
├── winapps/
````

## Theme & Noctalia Shell

> **Many of these configurations will not look or work correctly out of the box without [Noctalia Shell](https://noctalia.dev).**

Noctalia provides much of the desktop theming used by this setup, and several applications are configured around its themes.

If you use Noctalia, configure it to use the custom themes included in this repository where applicable.

If you **do not** use Noctalia, you will need to manually configure the themes for:

* Equibop
* Fastfetch
* Foot
* Ghostty
* Helix
* Kitty
* Qutebrowser
* Umbriel

The Noctalia configuration itself is intentionally **not** included in this repository.

## Links

The main projects and resources used by this setup:

| Project        | Link                                                                                     |
| -------------- | ---------------------------------------------------------------------------------------- |
| Noctalia Shell | [noctalia.dev](https://noctalia.dev)                                                     |
| Concord        | [github.com/chojs23/concord](https://github.com/chojs23/concord)                         |
| Equibop        | [equibop.org](https://equibop.org/)                                                      |
| Fastfetch      | [github.com/fastfetch-cli/fastfetch](https://github.com/fastfetch-cli/fastfetch)         |
| Fetch          | [github.com/areofyl/fetch](https://github.com/areofyl/fetch)                             |
| Foot           | [codeberg.org/dnkl/foot](https://codeberg.org/dnkl/foot)                                 |
| Ghostty        | [ghostty.org](https://ghostty.org/)                                                      |
| Helix          | [helix-editor.com](https://helix-editor.com/)                                            |
| Kitty          | [github.com/kovidgoyal/kitty](https://github.com/kovidgoyal/kitty)                       |
| MPV            | [mpv.io](https://mpv.io/)                                                                |
| Qutebrowser    | [qutebrowser.org](https://qutebrowser.org)                                               |
| Umbriel        | [github.com/noctalia-dev/umbriel](https://github.com/noctalia-dev/umbriel)               |
| WinApps        | [github.com/winapps-org/winapps](https://github.com/winapps-org/winapps)                 |

## MPV

MPV configuration, [Material OSC](https://github.com/brahmkshatriya/material-osc), scripts, fonts, and script options are included.

The MPV shaders are **not** included.

For Anime4K and its shader installation/configuration instructions, see the [Anime4K repository](https://github.com/bloc97/Anime4K).

## What's Excluded

The repository intentionally excludes generated, dynamic, or unnecessary configuration.

Not included:

* Noctalia configuration
* Qutebrowser `autoconfig.yml`
* Qutebrowser Noctalia-specific configuration
* Umbriel `noctalia.toml`
* MPV shaders
* Kitty themes
* Helix themes
* Foot themes
* Fastfetch themes
* Concord logs
* Other temporary/generated files

## Manual Workflow

The live configurations are kept in:

```text
~/.config/
```

The Git repository is:

```text
~/.dotfiles/
```

There are **no symlinks** between them.

Changes are manually copied from the live configuration into the repository.

For example:

```bash
cp ~/.config/ghostty/config.ghostty ~/.dotfiles/ghostty/config.ghostty
```

The repository does not automatically synchronize with `~/.config`.

### Workflow

```text
Edit configuration
       ↓
Test it
       ↓
Manually copy changes to ~/.dotfiles
       ↓
Review changes
       ↓
dotfrost
       ↓
Local Git commit
       ↓
dot-push
       ↓
GitHub
```

## Dotfiles Commands

The dotfiles Git aliases are defined in `shell.nix`.

| Command      | Purpose                           |
| ------------ | --------------------------------- |
| `dot`        | Enter `~/.dotfiles`               |
| `dot-status` | Show repository status            |
| `dot-diff`   | Show unstaged changes             |
| `dot-add`    | Stage all changes                 |
| `dot-log`    | Show Git history                  |
| `dot-remote` | Show Git remote                   |
| `dotfrost`   | Stage, review, and locally commit |
| `dot-push`   | Push local commits to GitHub      |

## `dotfrost`

`dotfrost` is the preferred way to commit dotfiles changes.

It:

1. Stages all changes
2. Shows the staged files
3. Shows the staged diff
4. Asks for a commit message
5. Creates a local commit

```bash
dotfrost
```

It does **not**:

* copy files from `~/.config`
* modify live configuration
* generate a commit message
* push to GitHub

After committing:

```bash
dot-push
```

can be used to push the commit.

This keeps committing and publishing as two separate operations.

## Fresh Machine Setup

### 1. Clone

```bash
git clone https://github.com/bwoah-md/dotfiles.git ~/.dotfiles
```

### 2. Restore

Use:

```bash
dotrestore
```

This restores the application configurations into `~/.config` and `.zshrc` into `~/.zshrc`.

### 3. Configure Noctalia

Install and configure [Noctalia Shell](https://noctalia.dev).

Configure its custom themes as appropriate for the applications in this repository.

If Noctalia is not being used, manually adjust the theme references and colors for the applications listed above.

## Zsh Configuration

The broader declarative Zsh configuration is maintained in the NixOS repository:

[users/icy/shell.nix](https://github.com/bwoah-md/nixbtw/blob/main/users/icy/shell.nix)

It contains the main Zsh configuration, aliases, shell initialization, completion, keybindings, and other shell functionality.

This repository contains the `.zshrc` used alongside that configuration.

## NixOS & Dotfiles

The two repositories are intentionally separate.

### NixOS

```text
~/.config/nixos/
```

Contains the system configuration, packages, services, hardware configuration, NixOS modules, and declarative user environment.

Repository:

[github.com/bwoah-md/nixbtw](https://github.com/bwoah-md/nixbtw)

### Dotfiles

```text
~/.dotfiles/
```

Contains application configurations, themes, scripts, shaders, and `.zshrc`.

Repository:

[github.com/bwoah-md/dotfiles](https://github.com/bwoah-md/dotfiles)

## Philosophy

```text
~/.config
    │
    │ manual copy
    ▼
~/.dotfiles
    │
    │ dotfrost
    ▼
local Git commit
    │
    │ dot-push
    ▼
GitHub
```

The repository is a **version-controlled copy of the configurations**, not a replacement for their live locations.

* No symlinks
* No automatic synchronization
* No automatic pushing
* Manual copying
* Review before committing
* Separate commit and push operations
