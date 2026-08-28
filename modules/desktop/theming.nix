{ pkgs, lib, ... }:

{
  # Ensure D-Bus services and theming backend work properly for GTK/Nautilus
  programs.dconf.enable = lib.mkDefault true;
  services.gvfs.enable = lib.mkDefault true;

  # Let NixOS configure QT_QPA_PLATFORMTHEME automatically
  qt = {
    enable = true;
    platformTheme = "qt5ct";
  };

  environment.systemPackages = with pkgs; [
    # GTK / Desktop Integration & Theming
    nautilus
    adw-gtk3
    nwg-look
    papirus-icon-theme
    adwaita-icon-theme
    bibata-cursors

    # Qt Theming
    libsForQt5.qt5ct
    kdePackages.qt6ct
    kdePackages.kcolorscheme
  ];
}
