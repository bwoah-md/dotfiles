{ pkgs, inputs, lib, ... }:

let
  custom = import ./custom.nix { inherit pkgs lib; };
in
{
  environment.systemPackages = with pkgs; [
    # Custom Derivations
    custom.swash
    custom.cliamp
    custom.superseedr

    # Shell & Multiplexers
    zsh-powerlevel10k
    zellij

    # Browsers & Flakes
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.twilight
    tor-browser
    mullvad-browser
    qutebrowser

    # Development & Editors
    nil
    nixpkgs-fmt
    zed-editor
    neovim
    nodejs
    python3
    jq

    # CLI Utilities & System Monitoring
    concord-tui
    ghostty
    btop
    fastfetch
    yazi
    ripgrep
    wget
    curl
    rsync
    tree
    ncdu
    pciutils
    usbutils
    dmidecode
    smartmontools
    alsa-utils

    # Windows / RDP
    freerdp
    dialog
    libnotify
    netcat-openbsd

    # Wayland & Screen Utilities
    grim
    slurp
    hyprpicker
    wl-clipboard
    gpu-screen-recorder
    ffmpegthumbnailer

    # Viewers, Media & Comms
    mpv
    ffmpeg
    yt-dlp
    obs-studio
    qview
    sioyek
    cava
    scrcpy
    obsidian
    vesktop
    signal-desktop
    telegram-desktop

    # Terminal Toys
    cbonsai
    unimatrix

    # Archives
    _7zz
    unzip
    unrar
  ];
}
