{ inputs, pkgs, ... }:

{
  imports = [
    inputs.umbriel.nixosModules.default
  ];

  programs.umbriel.enable = true;

  # Umbriel Portal Overlay
  nixpkgs.overlays = [
    inputs.xdg-desktop-portal-umbriel.overlays.default
  ];

  # Desktop Portals for ScreenCast / Screenshot + GTK fallbacks
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-umbriel
    ];

    config.umbriel = {
      default = [ "gtk" ];
      "org.freedesktop.impl.portal.ScreenCast" = [ "umbriel" ];
      "org.freedesktop.impl.portal.Screenshot" = [ "umbriel" ];
    };
  };
}
