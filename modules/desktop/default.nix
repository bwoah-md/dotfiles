{ inputs, pkgs, lib, ... }:
{
  imports = [
    inputs.umbriel.nixosModules.default
    ./greeter.nix
    ./theming.nix
  ];
  programs.niri.enable = true;
  programs.umbriel.enable = true;

  # Noctalia shell and desktop environment integration
  programs.noctalia = {
    enable = true;
    recommendedServices.enable = true;
  };

  # Desktop Portals configuration
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
    config = {
      umbriel = {
        default = [ "gtk" ];
        "org.freedesktop.impl.portal.ScreenCast" = [ "umbriel" ];
        "org.freedesktop.impl.portal.Screenshot" = [ "umbriel" ];
      };
      # FIXED — programs.niri.enable already ships its own portal default for
      # the "niri" desktop category: default = "gnome;gtk" (prefer gnome,
      # fall back to gtk). That's what was actually answering
      # org.freedesktop.portal.Settings (color-scheme, accent-color,
      # icon-theme) — the gnome backend, not gtk — which is what was
      # producing GTK app theming that didn't match your actual GTK/dconf
      # settings. Adding a plain `niri = { ... }` block here conflicts with
      # that module default (two definitions, same priority), so it must be
      # forced instead.
      niri = lib.mkForce {
        default = [ "gtk" ];
        "org.freedesktop.impl.portal.ScreenCast" = [ "gnome" ];
        "org.freedesktop.impl.portal.Screenshot" = [ "gnome" ];
      };
    };
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
  };

  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      # Primary Monospace / Coding Font
      maple-mono.NF-CN
      # Fallback & Icon Fonts
      nerd-fonts.jetbrains-mono
      nerd-fonts.iosevka
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      font-awesome
      undefined-medium
      terminus_font_ttf
    ];
    fontconfig = {
      defaultFonts = {
        monospace = [ "Terminus (TTF)" "Maple Mono NF CN" "JetBrainsMono Nerd Font" "Noto Sans Mono" ];
        sansSerif = [ "Noto Sans" "Noto Sans CJK SC" ];
        serif = [ "Noto Serif" "Noto Serif CJK SC" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
