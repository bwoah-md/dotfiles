{ pkgs, inputs, ... }:

let
  localsend-wrapped = pkgs.symlinkJoin {
    name = "localsend";
    paths = [ pkgs.localsend ];
    nativeBuildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/localsend_app \
        --set GDK_BACKEND wayland \
        --set GTK_CSD 0 \
        --add-flags "--hidden-title-bar"
    '';
  };
in
{
  # OBS Studio (the v4l2loopback kernel module itself lives in core/boot.nix)
  programs.obs-studio = {
    enable = true;
    enableVirtualCamera = true;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-vaapi
      obs-vkcapture
      obs-pipewire-audio-capture
    ];
  };

  # LocalSend
  programs.localsend = {
    enable = true;
    openFirewall = true;
    package = localsend-wrapped;
  };

  # Misc integrations
  programs.nix-ld.enable = true;
  programs.kdeconnect.enable = true;

  programs.helium = {
    enable = true;
    flags = [
      "--ozone-platform-hint=auto"
      "--enable-features=TouchpadOverscrollHistoryNavigation"
    ];
  };

  environment.systemPackages = [
    localsend-wrapped
    (inputs.surge.packages.${pkgs.stdenv.hostPlatform.system}.default.overrideAttrs (old: {
      vendorHash = "sha256-5iS75LoN9FC57XRAbIU+Pia1gcXyeiF7bqF3pndYXwM=";
    }))
  ];
}
