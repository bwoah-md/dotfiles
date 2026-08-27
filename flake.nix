{
  description = "NixOS Flake Configuration for icy@nix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    noctalia.url = "github:noctalia-dev/noctalia/cachix";

    noctalia-greeter = {
      url = "github:noctalia-dev/noctalia-greeter";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    helium-flake = {
      url = "github:oxcl/nix-flake-helium-browser";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    surge.url = "github:SurgeDM/Surge/08d09d11199acf6082a89c4da0d19a04749de997";

    winapps = {
      url = "github:winapps-org/winapps";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    umbriel = {
      url = "git+https://github.com/noctalia-dev/umbriel.git?submodules=1";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    xdg-desktop-portal-umbriel = {
      url = "git+https://github.com/noctalia-dev/xdg-desktop-portal-umbriel.git?submodules=1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.nix = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/nix
        inputs.noctalia.nixosModules.default
        inputs.noctalia-greeter.nixosModules.default
        inputs.helium-flake.nixosModules.default
      ];
    };
  };
}
