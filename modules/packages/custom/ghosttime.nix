{ pkgs }:

pkgs.stdenv.mkDerivation (finalAttrs: {
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
})
