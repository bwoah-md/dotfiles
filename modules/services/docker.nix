{ ... }:

{
  # Docker service configured for manual, on-demand start (no boot overhead)
  virtualisation.docker = {
    enable = true;
    enableOnBoot = false;
    autoPrune.enable = true;
  };
}
