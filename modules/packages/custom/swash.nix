{ pkgs, lib }:

pkgs.stdenv.mkDerivation (finalAttrs: {
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
})
