{ pkgs }:

pkgs.rustPlatform.buildRustPackage {
  pname = "superseedr";
  version = "1.0.14-unstable-2026-08-29";

  src = pkgs.fetchFromGitHub {
    owner = "Jagalite";
    repo = "superseedr";
    rev = "f484b50d144fb077e4f6e5ee3d2ce59273a8cf1a";
    hash = "sha256-RCPz4ugU7V5B6jl0wUg/mPxvoUX/TF0RM18tT0caTIM=";
  };

  cargoHash = "sha256-F6omghG3PWC9nQ/FNcDNm3r9+mpENx/npqiqD9tvi8Q=";
  doCheck = false;

  nativeBuildInputs = [ pkgs.pkg-config ];
  buildInputs = [ pkgs.openssl ];

  meta.mainProgram = "superseedr";
}
