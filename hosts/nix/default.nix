{ ... }:

{
  imports = [
    ./hardware-configuration.nix

    ../../modules/umbriel.nix
    ../../modules/core
    ../../modules/desktop
    ../../modules/hardware/intel.nix
    ../../modules/services
    ../../modules/packages

    ../../users/icy
  ];

  system.stateVersion = "26.05";
}
