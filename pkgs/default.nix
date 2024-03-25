{
  systems = [ "x86_64-linux" ];
  perSystem =
    { pkgs
    , inputs
    , ...
    }: {
      packages = {
        # instant repl with automatic flake loading
        everforest-gtk-theme = pkgs.callPackage ./everforest-gtk { };
      };
    };
}
