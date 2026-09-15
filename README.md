# icy@dotfiles

Personal configuration files for `icy`, maintained separately from the NixOS system configuration.

This repository contains the application-level configuration that lives under `~/.config`, along with `~/.zshrc`.

The live configurations remain in their normal locations. This repository is a **manual copy-based backup and version-control repository** — no symlinks and no automatic synchronization.

## Structure

```text
.dotfiles/
├── .zshrc
├── concord/
│   ├── config.toml
│   ├── keymap.toml
│   └── theme.toml
├── equibop/
│   └── settings/
│       ├── quickCss.css
│       └── settings.json
├── fastfetch/
│   ├── config.jsonc
│   └── nixos-small.txt
├── fetch/
│   └── config
├── foot/
│   └── foot.ini
├── ghostty/
│   ├── config.ghostty
│   └── shaders/
│       ├── cursor_sweep.glsl
│       └── cursor_wrap.glsl
├── helix/
│   └── config.toml
├── kitty/
│   └── kitty.conf
├── mpv/
│   ├── fonts/
│   │   ├── material-osc_google_sans_flex.ttf
│   │   └── material-osc_icons.otf
│   ├── input.conf
│   ├── mpv.conf
│   ├── script-opts/
│   │   ├── material-osc-updater.conf
│   │   ├── material-osc.conf
│   │   └── thumbfast.conf
│   └── scripts/
│       ├── material-osc.lua
│       └── thumbfast.lua
├── qutebrowser/
│   ├── bookmarks/urls
│   ├── config.py
│   ├── greasemonkey/
│   │   ├── YouTube???.js
│   │   ├── hide-brave-elements.user.js
│   │   └── yt-theater.js
│   ├── quickmarks
│   ├── startpage/
│   │   ├── cat-transparent.gif
│   │   ├── cat.gif
│   │   ├── colors.css
│   │   ├── index.html
│   │   ├── style.css
│   │   └── template.css
│   └── styles/
│       ├── hide-scrollbars.css
│       └── youtube-tweaks.css
├── surge/
│   └── themes/
│       ├── adaptive-theme.toml
│       ├── catppuccin.toml
│       ├── gruvbox.toml
│       ├── nord.toml
│       └── surge.toml
├── umbriel/
│   ├── cfg/
│   │   ├── animation.toml
│   │   ├── appearance.toml
│   │   ├── autostart.toml
│   │   ├── events.toml
│   │   ├── hot-corners.toml
│   │   ├── input.toml
│   │   ├── keybinds.toml
│   │   ├── layer-rule.toml
│   │   ├── layout.toml
│   │   ├── outputs.toml
│   │   ├── overview.toml
│   │   ├── rules.toml
│   │   └── workspaces.toml
│   ├── config.toml
│   └── shaders/
│       ├── blinds.glsl
│       ├── bloom.glsl
│       ├── halftone.glsl
│       └── watr.glsl
├── winapps/
│   └── winapps.conf
└── zed/
    └── settings.json
````

## Theme & Noctalia Shell

This repository is heavily tied to the theme setup used on my system.

**Many of these configurations will not look or work correctly out of the box if you are not using [Noctalia Shell](https://noctalia.dev).**

Noctalia is responsible for parts of the overall desktop theming and provides the theme files/configuration that these applications reference.

If you use Noctalia, configure it to use the custom themes contained in this repository where applicable.

If you **do not** use Noctalia, some applications will need to be manually configured to match your preferred theme.

The applications that may require manual theme configuration are:

* **Equibop**
* **Fastfetch**
* **Foot**
* **Ghostty**
* **Helix**
* **Kitty**
* **Qutebrowser**
* **Umbriel**
* **Zed**

The repository intentionally does **not** contain the Noctalia configuration itself.

## What's Included

### Concord

```text
concord/
├── config.toml
├── keymap.toml
└── theme.toml
```

Contains the main [Concord](https://github.com/chojs23/concord) configuration, keybindings, and theme.

### Equibop

```text
equibop/
└── settings/
    ├── quickCss.css
    └── settings.json
```

Contains [Equibop](https://equibop.org/) settings and custom CSS.

### Fastfetch

```text
fastfetch/
├── config.jsonc
└── nixos-small.txt
```

Contains the [Fastfetch](https://github.com/fastfetch-cli/fastfetch) configuration and the custom NixOS ASCII art.

### Fetch

```text
fetch/
└── config
```

Contains the [Fetch](https://github.com/areofyl/fetch) configuration.

### Foot

```text
foot/
└── foot.ini
```

Contains the [Foot](https://codeberg.org/dnkl/foot) terminal configuration.

### Ghostty

```text
ghostty/
├── config.ghostty
└── shaders/
    ├── cursor_sweep.glsl
    └── cursor_wrap.glsl
```

Contains the [Ghostty](https://ghostty.org/) configuration and custom cursor shaders.

### Helix

```text
helix/
└── config.toml
```

Contains the [Helix](https://helix-editor.com/) editor configuration.

### Kitty

```text
kitty/
└── kitty.conf
```

Contains the [Kitty](https://github.com/kovidgoyal/kitty) terminal configuration.

### MPV

```text
mpv/
├── fonts/
│   ├── material-osc_google_sans_flex.ttf
│   └── material-osc_icons.otf
├── input.conf
├── mpv.conf
├── script-opts/
│   ├── material-osc-updater.conf
│   ├── material-osc.conf
│   └── thumbfast.conf
└── scripts/
    ├── material-osc.lua
    └── thumbfast.lua
```

Contains the [MPV](https://mpv.io/) configuration, [Material OSC](https://github.com/brahmkshatriya/material-osc) files, scripts, script options, and fonts.

### MPV Shaders

The MPV shaders are **not included in this repository**.

For Anime4K and its shader installation/configuration instructions, see:

[github/bloc97/Anime4K](https://github.com/bloc97/Anime4K)

### Qutebrowser

```text
qutebrowser/
├── bookmarks/
│   └── urls
├── config.py
├── greasemonkey/
│   ├── YouTube???.js
│   ├── hide-brave-elements.user.js
│   └── yt-theater.js
├── quickmarks
├── startpage/
│   ├── cat-transparent.gif
│   ├── cat.gif
│   ├── colors.css
│   ├── index.html
│   ├── style.css
│   └── template.css
└── styles/
    ├── hide-scrollbars.css
    └── youtube-tweaks.css
```

Contains the [Qutebrowser](https://qutebrowser.org) configuration, bookmarks, quickmarks, userscripts, custom start page, and custom styles.

Qutebrowser's automatically generated `autoconfig.yml` is intentionally excluded.

### Surge

Only the theme files are maintained here:

```text
surge/
└── themes/
    ├── adaptive-theme.toml
    ├── catppuccin.toml
    ├── gruvbox.toml
    ├── nord.toml
    └── surge.toml
```

Other [Surge](https://github.com/SurgeDM/Surge) configuration files are intentionally excluded.

### Umbriel

```text
umbriel/
├── cfg/
│   ├── animation.toml
│   ├── appearance.toml
│   ├── autostart.toml
│   ├── events.toml
│   ├── hot-corners.toml
│   ├── input.toml
│   ├── keybinds.toml
│   ├── layer-rule.toml
│   ├── layout.toml
│   ├── outputs.toml
│   ├── overview.toml
│   ├── rules.toml
│   └── workspaces.toml
├── config.toml
└── shaders/
    ├── blinds.glsl
    ├── bloom.glsl
    ├── halftone.glsl
    └── watr.glsl
```

Contains the main [Umbriel](https://github.com/noctalia-dev/umbriel) configuration, individual configuration modules, and shaders.

The Noctalia-specific Umbriel configuration is intentionally excluded.

### WinApps

```text
winapps/
└── winapps.conf
```

Contains the [WinApps](https://github.com/winapps-org/winapps) configuration.

### Zed

```text
zed/
└── settings.json
```

Contains the [Zed](https://zed.dev/) editor settings.

## What's Not Included

The repository deliberately excludes configuration that is either dynamically generated, unnecessary to reproduce the environment, or managed elsewhere.

Notably:

* **Noctalia Shell configuration**
* Qutebrowser `autoconfig.yml`
* Qutebrowser Noctalia-specific configuration
* Umbriel `noctalia.toml`
* Surge keymap/settings
* MPV shaders
* Kitty themes
* Helix themes
* Foot themes
* Fastfetch themes
* Zed themes
* Concord logs
* Other generated/log/temporary files

The goal is to keep this repository focused on the configurations that are actually useful to reproduce the setup.

## Manual Dotfiles Workflow

The live configuration files remain in their normal locations under:

```text
~/.config/
```

The Git repository is located at:

```text
~/.dotfiles/
```

There are **no symlinks** between the two.

Changes are copied manually from the live configuration into the repository.

For example:

```bash
cp ~/.config/ghostty/config.ghostty ~/.dotfiles/ghostty/config.ghostty
```

This is intentional.

The repository does not automatically pull changes from `~/.config`, and `dotfrost` does not perform this copy.

The workflow is:

```text
Edit live configuration
        ↓
Test configuration
        ↓
Manually copy desired changes
        ↓
~/.dotfiles
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

## Dotfiles Git Commands

The dotfiles repository has several Zsh aliases defined in `shell.nix`.

### Enter the repository

```bash
dot
```

Equivalent to:

```bash
cd ~/.dotfiles
```

### Check repository status

```bash
dot-status
```

Equivalent to:

```bash
git -C ~/.dotfiles status
```

Shows modified, deleted, untracked, and staged files.

### View unstaged changes

```bash
dot-diff
```

Equivalent to:

```bash
git -C ~/.dotfiles diff
```

Shows changes that have not yet been staged.

### Stage everything

```bash
dot-add
```

Equivalent to:

```bash
git -C ~/.dotfiles add -A
```

Stages all additions, modifications, and deletions.

### View commit history

```bash
dot-log
```

Equivalent to:

```bash
git -C ~/.dotfiles log --oneline --decorate --graph
```

Displays the repository history in a compact graphical format.

### View the Git remote

```bash
dot-remote
```

Equivalent to:

```bash
git -C ~/.dotfiles remote -v
```

Shows the configured GitHub remote.

### Push to GitHub

```bash
dot-push
```

Equivalent to:

```bash
git -C ~/.dotfiles push
```

This is deliberately separate from `dotfrost`.

## `dotfrost`

`dotfrost` is the preferred workflow for committing dotfiles changes.

It performs four main operations:

1. Stages all repository changes.
2. Displays the files that have been staged.
3. Displays the complete staged diff for review.
4. Asks for a commit message and creates a local commit.

```bash
dotfrost
```

The function is intentionally **manual and review-oriented**.

It does **not**:

* copy files from `~/.config`
* modify live configuration files
* generate a commit message automatically
* push to GitHub

A typical run looks like:

```text
==> Staging dotfiles...

==> Changes staged:
 M ghostty/config.ghostty
 M qutebrowser/config.py
?? some-new-config

==> Staged diff:
...

Commit message: update ghostty and qutebrowser configs

==> Creating commit...
```

After `dotfrost` finishes, the commit exists **only locally**.

Push it separately:

```bash
dot-push
```

This separation makes it possible to review and commit changes without immediately publishing them.

## Fresh Machine Setup

### 1. Clone the repository

```bash
git clone https://github.com/bwoah-md/dotfiles.git ~/.dotfiles
```

### 2. Copy configurations into `~/.config`

The repository intentionally mirrors the relevant portions of `~/.config`.

For example:

```bash
cp -r ~/.dotfiles/ghostty ~/.config/
cp -r ~/.dotfiles/helix ~/.config/
cp -r ~/.dotfiles/kitty ~/.config/
```

For applications where only individual files are required, copy those files into their expected locations.

Do **not** create symlinks unless you intentionally want to change the workflow described by this repository.

### 3. Restore `.zshrc`

The repository also contains:

```text
.zshrc
```

Copy it into your home directory:

```bash
cp ~/.dotfiles/.zshrc ~/.zshrc
```

The Zsh configuration contains the dotfiles aliases and `dotfrost` workflow.

### 4. Configure Noctalia

If you use Noctalia Shell, install and configure it from:

[https://noctalia.dev](https://noctalia.dev)

The Noctalia configuration itself is **not** included in this repository.

After installing Noctalia, configure its custom themes as appropriate for the applications in this repository.

If you do not use Noctalia, expect to manually adjust theme references and colors in several application configurations.

## Zsh Configuration

The broader Zsh/NixOS shell setup is maintained in the main NixOS repository:

[https://github.com/bwoah-md/nixbtw/blob/main/users/icy/shell.nix](https://github.com/bwoah-md/nixbtw/blob/main/users/icy/shell.nix)

That file contains the declarative Zsh configuration, general aliases, NixOS aliases, shell initialization, completion configuration, keybindings, and other shell functionality.

This repository only tracks the `.zshrc` side of the dotfiles setup.

## Relationship With NixOS Configuration

The NixOS configuration and this repository serve different purposes.

### NixOS

```text
~/.config/nixos/
```

Contains:

* system configuration
* hardware configuration
* NixOS modules
* user configuration
* packages
* declarative shell configuration
* system-level services

Repository:

```text
https://github.com/bwoah-md/nixbtw
```

### Dotfiles

```text
~/.dotfiles/
```

Contains:

* terminal configurations
* editor configurations
* browser configurations
* application settings
* themes
* scripts
* shaders
* `.zshrc`

Repository:

```text
https://github.com/bwoah-md/dotfiles
```

The two repositories are intentionally separate.

## Useful Commands

```bash
# Enter dotfiles repository
dot

# Check repository state
dot-status

# View unstaged changes
dot-diff

# Stage everything
dot-add

# View history
dot-log

# View Git remote
dot-remote

# Stage, review, and locally commit
dotfrost

# Push local commits to GitHub
dot-push
```

## Philosophy

This repository intentionally keeps the workflow simple:

```text
~/.config
   │
   │  manual copy
   ▼
~/.dotfiles
   │
   │  git commit
   ▼
local Git history
   │
   │  dot-push
   ▼
GitHub
```

The repository is a **version-controlled copy of the configurations**, not a replacement for their live locations.

No symlink farm.

No automatic synchronization.

No automatic pushing.

Changes are made deliberately, reviewed deliberately, committed deliberately, and pushed deliberately.

```

This follows the same general structure as your NixOS README—**Structure → setup → workflow → commands → specific configuration details**—but makes the dotfiles/manual-sync distinction explicit. :contentReference[oaicite:0]{index=0}
```
