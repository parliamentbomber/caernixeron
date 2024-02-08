{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  gnome-themes-extra,
  gtk-engine-murrine,
}:
stdenvNoCC.mkDerivation {
  pname = "kanagawa-gtk-theme";
  version = "unstable-2023-05-28";

  src = fetchFromGitHub {
    owner = "Fausto-Korpsvart";
    repo = "Kanagawa-GKT-Theme";
    rev = "35936a1e3bbd329339991b29725fc1f67f192c1e";
    hash = "sha256-BZRmjVas8q6zsYbXFk4bCk5Ec/3liy9PQ8fqFGHAXe0=";
  };

  propagatedUserEnvPkgs = [
    gtk-engine-murrine
  ];

  buildInputs = [
    gnome-themes-extra
  ];

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/themes
    cp -a themes/* $out/share/themes
    runHook postInstall
  '';

  meta = with lib; {
    description = "A Gtk theme based on the Gruvbox colour pallete";
    homepage = "https://www.pling.com/p/1681313/";
    license = licenses.gpl3Only;
    platforms = platforms.unix;
    maintainers = [maintainers.math-42];
  };
}
