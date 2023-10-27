{
  pkgs ?
    import <nixpkgs> {},
  stdenv,
  lib,
  fetchurl,
  gtk-engine-murrine,
}:
pkgs.stdenv.mkDerivation rec {
  name = "";
  version = "1.0";

src = fetchFromGithub {
  owner = "carnarferon";
  repo = Gruvbox-GTK-Theme-but-mine;
  rev = "v${version}";
  hash = "sha256-UKbLRhoLjd93db5Pg15yxJ2lp9R5uJoNDEwBw5RoPdU=";
};

  sourceRoot = ".";

  propagatedUserEnvPkgs = [gtk-engine-murrine];

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/themes
    cp -a Gruvbox-Dark-BL-LB* $out/share/themes
    rm $out/share/themes/*/{LICENSE,README.md}
    runHook postInstall
  '';

  meta = with lib; {
    description = "GTK themes inspired by epic vscode themes";
    homepage = "https://github.com/caernarferon/Gruvbox-GTK-Theme-but-mine";
    license = licenses.gpl3Only;
    platforms = platforms.all;
    maintainers = [maintainers.caernarferon];
  };
}
