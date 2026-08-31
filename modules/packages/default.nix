{ pkgs, inputs, lib, ... }:

let
  customPackages = import ./custom.nix {
    inherit pkgs lib;
  };
in
{
  nixpkgs.config.allowUnfree = true;

  environment.sessionVariables = {
    NIXPKGS_ALLOW_UNFREE = "1";
  };

  environment.systemPackages = with pkgs; [
    # ─────────────────────────────────────────────────
    # Custom Packages
    # ─────────────────────────────────────────────────
    customPackages.swash
    customPackages.superseedr
    customPackages.ghosttime

    # ─────────────────────────────────────────────────
    # Shell & Terminal
    # ─────────────────────────────────────────────────
    zellij
    ghostty
    btop
    fastfetch
    yazi
    ripgrep
    tree
    ncdu
    concord-tui
    cliamp

    # Terminal Toys
    cbonsai
    unimatrix

    # ─────────────────────────────────────────────────
    # Development
    # ─────────────────────────────────────────────────
    zed-editor
    nixd
    nil
    nixfmt
    nix-update
    nodejs
    python3
    jq

    # ─────────────────────────────────────────────────
    # Neovim Tools
    # ─────────────────────────────────────────────────
    gcc
    neovim
    fd
    lazygit
    tree-sitter
    imagemagick

    # ─────────────────────────────────────────────────
    # Browsers
    # ─────────────────────────────────────────────────
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.twilight
    tor-browser
    mullvad-browser
    qutebrowser

    # ─────────────────────────────────────────────────
    # CLI / File Utilities
    # ─────────────────────────────────────────────────
    wget
    curl
    rsync

    # Archives
    _7zz
    unzip
    unrar

    # ─────────────────────────────────────────────────
    # Hardware & System Diagnostics
    # ─────────────────────────────────────────────────
    # pciutils
    # usbutils
    # dmidecode
    # smartmontools
    # alsa-utils

    # ─────────────────────────────────────────────────
    # Wayland / Desktop Utilities
    # ─────────────────────────────────────────────────
    hyprpicker
    wl-clipboard
    gpu-screen-recorder
    ffmpegthumbnailer

    # ─────────────────────────────────────────────────
    # Media
    # ─────────────────────────────────────────────────
    mpv
    ffmpeg
    yt-dlp
    obs-studio
    qview
    sioyek
    cava
    scrcpy

    # ─────────────────────────────────────────────────
    # Communication
    # ─────────────────────────────────────────────────
    vesktop
    signal-desktop
    telegram-desktop

    # ─────────────────────────────────────────────────
    # Windows / Remote Desktop
    # ─────────────────────────────────────────────────
    freerdp
    dialog
    libnotify
    netcat-openbsd

    # ─────────────────────────────────────────────────
    # Applications
    # ─────────────────────────────────────────────────
    obsidian
  ];
}
