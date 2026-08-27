{ pkgs, lib, ... }:

{
  # Ensure D-Bus services and theming backend work properly for GTK/Nautilus
  programs.dconf.enable = lib.mkDefault true;
  services.gvfs.enable = lib.mkDefault true;

  environment.systemPackages = with pkgs; [
    # GTK / Desktop Integration & Theming
    nautilus
    adw-gtk3
    nwg-look
    papirus-icon-theme
    adwaita-icon-theme
    bibata-cursors

    # Qt Theming
    kdePackages.qt6ct
    kdePackages.kcolorscheme
  ];
}
