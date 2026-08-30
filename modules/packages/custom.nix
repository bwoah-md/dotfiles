{ pkgs, lib }:

{
  swash = pkgs.stdenv.mkDerivation (finalAttrs: {
    pname = "swash";
    version = "1.5.1";

    src = pkgs.fetchFromGitHub {
      owner = "ItsLemmy";
      repo = "swash";
      rev = "v${finalAttrs.version}";
      hash = "sha256-SxdrsKUIDLUfWQp7Wa50NwFo36h3LzMd6SOBIy14KAA=";
    };

    nativeBuildInputs = with pkgs; [
      meson
      ninja
      pkg-config
      wrapGAppsHook4
    ];

    buildInputs = with pkgs; [
      gtk4
      libadwaita
    ];

    preFixup = ''
      gappsWrapperArgs+=(--prefix PATH : "${lib.makeBinPath (with pkgs; [
        tesseract
        wl-clipboard
      ])}")
    '';

    meta.mainProgram = "swash";
  });

  superseedr = pkgs.rustPlatform.buildRustPackage {
    pname = "superseedr";
    version = "1.0.14";

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
  };

  ghosttime = pkgs.stdenv.mkDerivation (finalAttrs: {
    pname = "ghosttime";
    version = "1.3.0";

    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/ghosttime/-/ghosttime-${finalAttrs.version}.tgz";
      hash = "sha256-QKR1OO+ZlCZm3tHXpGse2R0hH7G2xKwDm2H7/6tT5lU=";
    };

    nativeBuildInputs = [ pkgs.makeWrapper ];

    installPhase = ''
      runHook preInstall
      mkdir -p $out/lib/node_modules/ghosttime $out/bin
      cp -r . $out/lib/node_modules/ghosttime
      makeWrapper ${pkgs.nodejs}/bin/node $out/bin/ghosttime \
        --add-flags "$out/lib/node_modules/ghosttime/dist/cli.js"
      runHook postInstall
    '';

    meta.mainProgram = "ghosttime";
  });
}
