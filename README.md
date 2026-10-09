# icy@dotfiles

Personal configuration files maintained separately from the NixOS system configuration.

The live configurations remain in their normal locations under `~/.config`.

## NixOS

```text
~/.config/nixos/
```

Contains the system configuration, packages, services, hardware configuration, NixOS modules, and declarative user environment.

Repository:

[github.com/bwoah-md/nixbtw](https://github.com/bwoah-md/nixbtw)

## Structure

```text
.dotfiles/
├── concord/
├── equibop/
├── fastfetch/
├── fetch/
├── firefox/
├── foot/
├── ghostty/
├── helix/
├── kitty/
├── labwc/
├── mpv/
├── noctalia/
├── qutebrowser/
├── umbriel/
└── winapps/
````

## Theme & Noctalia Shell

> **Many of these configurations will not look or work correctly out of the box without [Noctalia Shell](https://noctalia.dev).**

Noctalia provides much of the desktop theming used by this setup, and several applications are configured around its themes.

If you use Noctalia, configure it to use the custom themes included in this repository where applicable.

If you **do not** use Noctalia, you will need to manually configure the themes for:

* Equibop
* Fastfetch
* Firefox/Librewolf etc.
* Foot
* Ghostty
* Helix
* Kitty
* Labwc
* Qutebrowser
* [TUIOS](https://tuios.dev)
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
| Labwc          | [labwc.github.io](https://labwc.github.io/)
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

* Noctalia configuration (because of API keys and passwords)
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

## Fresh Machine Setup

### 1. Clone

```bash
git clone https://github.com/bwoah-md/dotfiles.git ~/.dotfiles
```

### 2. Restore

Use:

```bash
cp -r ~/.dotfiles/* ~/.config/*
```

This restores the application configurations into `~/.config`.

### 3. Configure Noctalia

Install and configure [Noctalia Shell](https://noctalia.dev).

Configure its custom themes as appropriate for the applications in this repository.

If Noctalia is not being used, manually adjust the theme references and colors for the applications listed above.
