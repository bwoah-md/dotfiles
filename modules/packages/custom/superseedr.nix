{ pkgs }:

pkgs.rustPlatform.buildRustPackage {
  pname = "superseedr";
  version = "0.1.0-unstable";

  src = pkgs.fetchFromGitHub {
    owner = "Jagalite";
    repo = "superseedr";
    rev = "main";
    hash = "sha256-+ivUhDnwr0s4AaGkbJYsVrwhAhN5wGq+0Q4JKe4bWHk=";
  };

  cargoHash = "sha256-IVPUmED6xuYqIG5ryazpBEvQOOghgB32/2GJfaMMAuQ=";
  doCheck = false;

  nativeBuildInputs = [ pkgs.pkg-config ];
  buildInputs = [ pkgs.openssl ];

  meta.mainProgram = "superseedr";
}
