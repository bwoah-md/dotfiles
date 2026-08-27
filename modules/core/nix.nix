{
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];

    extra-substituters = [
      "https://noctalia.cachix.org"
      "https://zen-browser.cachix.org"
    ];

    extra-trusted-public-keys = [
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
      "zen-browser.cachix.org-1:76q99qkW1DYdE9mP4wMvX1G24yY17WkOqj7T+U21/W8="
    ];
  };

  nixpkgs.config.allowUnfree = true;
}
