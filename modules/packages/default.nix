{ pkgs, inputs, lib, ... }:

let
  swash = import ./custom/swash.nix { inherit pkgs lib; };
  superseedr = import ./custom/superseedr.nix { inherit pkgs; };
  ghosttime = import ./custom/ghosttime.nix { inherit pkgs; };
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
    swash
    cliamp
    superseedr
    ghosttime

    # ─────────────────────────────────────────────────
    # Shell & Terminal
    # ─────────────────────────────────────────────────
    zsh-powerlevel10k
    zellij
    ghostty
    btop
    fastfetch
    yazi
    ripgrep
    tree
    ncdu
    concord-tui

    # Terminal Toys
    cbonsai
    unimatrix

    # ─────────────────────────────────────────────────
    # Development
    # ─────────────────────────────────────────────────
    neovim
    zed-editor
    nixd
    nil
    nixfmt
    nix-update
    nodejs
    python3
    jq

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
    pciutils
    usbutils
    dmidecode
    smartmontools
    alsa-utils

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
