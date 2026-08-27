{ pkgs, lib, ... }:

{
  # ─── Swash (Screenshot Annotator) ───────────────────
  swash = pkgs.callPackage (
    { lib
    , stdenv
    , fetchFromGitHub
    , meson
    , ninja
    , pkg-config
    , wrapGAppsHook4
    , gtk4
    , libadwaita
    , tesseract
    , wl-clipboard
    }:

    stdenv.mkDerivation rec {
      pname = "swash";
      version = "1.5.1";

      src = fetchFromGitHub {
        owner = "ItsLemmy";
        repo = "swash";
        rev = "v${version}";
        hash = "sha256-SxdrsKUIDLUfWQp7Wa50NwFo36h3LzMd6SOBIy14KAA=";
      };

      nativeBuildInputs = [
        meson
        ninja
        pkg-config
        wrapGAppsHook4
      ];

      buildInputs = [
        gtk4
        libadwaita
      ];

      preFixup = ''
        gappsWrapperArgs+=(
          --prefix PATH : "${lib.makeBinPath [ tesseract wl-clipboard ]}"
        )
      '';

      meta = with lib; {
        description = "Screenshot annotator and lightweight image editor";
        homepage = "https://github.com/ItsLemmy/swash";
        license = licenses.gpl3Plus;
        platforms = platforms.linux;
        mainProgram = "swash";
      };
    }
  ) { };

  # ─── Cliamp (CLI Music Player) ──────────────────────
  cliamp = pkgs.buildGoModule {
    pname = "cliamp";
    version = "latest";
    src = pkgs.fetchFromGitHub {
      owner = "bjarneo";
      repo = "cliamp";
      rev = "main";
      hash = "sha256-lRiNYuxUQiOUsk/jhEMl1x6MCUFQ8wREI7yVX3yUcZY=";
    };
    vendorHash = "sha256-WYyv0w5KFA15axb+NA9tClfc1H4Znj8kI2boR8XziXg=";
    nativeBuildInputs = with pkgs; [
      pkg-config
    ];
    buildInputs = with pkgs; [
      alsa-lib
      libvorbis
      libogg
      flac
    ];
  };
  # ─── Superseedr (BitTorrent Seeding Tool) ─────────────
  superseedr = pkgs.rustPlatform.buildRustPackage {
    pname = "superseedr";
    version = "latest";

    src = pkgs.fetchFromGitHub {
      owner = "Jagalite";
      repo = "superseedr";
      rev = "main";
      hash = "sha256-+ivUhDnwr0s4AaGkbJYsVrwhAhN5wGq+0Q4JKe4bWHk=";
    };

    cargoHash = "sha256-IVPUmED6xuYqIG5ryazpBEvQOOghgB32/2GJfaMMAuQ=";

    doCheck = false;

    nativeBuildInputs = with pkgs; [
      pkg-config
    ];

    buildInputs = with pkgs; [
      openssl
    ];
  };
}
