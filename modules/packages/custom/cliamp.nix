{ pkgs }:

pkgs.buildGoModule {
  pname = "cliamp";
  version = "0.1.0-unstable";

  src = pkgs.fetchFromGitHub {
    owner = "bjarneo";
    repo = "cliamp";
    rev = "main";
    hash = "sha256-J4tU9WdpVx7iDKQCfFUEeN+I4YEdk4U0dEOgo2u+zSI=";
  };

  vendorHash = "sha256-/c2MOMnG8twpr2/9plFanXkJwoIYNwC0mPksTklIcRw=";

  nativeBuildInputs = [ pkgs.pkg-config ];
  buildInputs = with pkgs; [ alsa-lib libvorbis libogg flac mpg123 ];

  meta.mainProgram = "cliamp";
}
