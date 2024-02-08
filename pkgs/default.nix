{
  pkgs,
  inputs,
  self,
  ...
}: {
  packages = {
    # instant repl with automatic flake loading
    everforest-gtk-theme = pkgs.callPackage ./everforest-gtk {};
  };
}
