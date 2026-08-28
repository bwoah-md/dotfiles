{ inputs, pkgs, ... }:

{
  imports = [
    inputs.umbriel.nixosModules.default
  ];

  programs.umbriel.enable = true;

  # Desktop Portals configuration
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];

    config.umbriel = {
      default = [ "gtk" ];
      "org.freedesktop.impl.portal.ScreenCast" = [ "umbriel" ];
      "org.freedesktop.impl.portal.Screenshot" = [ "umbriel" ];
    };
  };
}
