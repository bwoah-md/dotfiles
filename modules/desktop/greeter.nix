{ pkgs, ... }:

{
  programs.noctalia-greeter = {
    enable = true;
    greeter-args = "--session niri --user icy";
    settings = {
      cursor = {
        theme = "Bibata-Modern-Ice";
        size = 24;
        path = "${pkgs.bibata-cursors}/share/icons";
      };
    };
  };
}
