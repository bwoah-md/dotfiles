{ pkgs, lib, ... }:

{
  # ─── Swash ──────────────────────────────────────────
  swash = pkgs.stdenv.mkDerivation (finalAttrs: {
    pname = "swash";
    version = "1.5.1";

    src = pkgs.fetchFromGitHub {
      owner = "ItsLemmy";
      repo = "swash";
      rev = "v${finalAttrs.version}";
      hash = "sha256-SxdrsKUIDLUfWQp7Wa50NwFo36h3LzMd6SOBIy14KAA=";
    };

    nativeBuildInputs = with pkgs; [ meson ninja pkg-config wrapGAppsHook4 ];
    buildInputs = with pkgs; [ gtk4 libadwaita ];

    preFixup = ''
      gappsWrapperArgs+=(--prefix PATH : "${lib.makeBinPath (with pkgs; [ tesseract wl-clipboard ])}")
    '';

    meta.mainProgram = "swash";
  });

  # ─── Cliamp ─────────────────────────────────────────
  cliamp = pkgs.buildGoModule {
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
  };

  # ─── Superseedr ─────────────────────────────────────
  superseedr = pkgs.rustPlatform.buildRustPackage {
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
  };

  # ─── Ghosttime ──────────────────────────────────────
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
