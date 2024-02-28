{
  systems = ["x86_64-linux"];
  perSystem = {
    pkgs,
    inputs,
    ...
  }: {
    packages = {
      # instant repl with automatic flake loading
      everforest-gtk-theme = pkgs.callPackage ./everforest-gtk {};
      torus = pkgs.stdenv.mkDerivation {
        name = "torus";
        version = "1.00";
        src = ./Torus-Regular.otf;

        installPhase = ''
          mkdir -p $out/share/fonts
          cp -r ./Torus-Regular.otf $out/share/fonts
        '';
      };
    };
  };
}
