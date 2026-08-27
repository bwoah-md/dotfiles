{ pkgs, ... }:

{
  imports = [
    ./greeter.nix
    ./theming.nix
  ];

  programs.niri.enable = true;

  # Noctalia shell and desktop environment integration
  programs.noctalia = {
    enable = true;
    recommendedServices.enable = true;
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
    ];

    fontconfig = {
      defaultFonts = {
        monospace = [ "Maple Mono NF CN" "JetBrainsMono Nerd Font" "Noto Sans Mono" ];
        sansSerif = [ "Noto Sans" "Noto Sans CJK SC" ];
        serif = [ "Noto Serif" "Noto Serif CJK SC" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
