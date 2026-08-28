{ pkgs, lib, ... }:

{
  programs.dconf.enable = lib.mkDefault true;
  services.gvfs.enable = lib.mkDefault true;

  # Declaratively set session variables for the entire desktop
  environment.sessionVariables = {
    QT_QPA_PLATFORMTHEME = lib.mkForce "qt6ct";
    QT_QPA_PLATFORM = "wayland;xcb";
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
    kdePackages.qtsvg
  ];
}
