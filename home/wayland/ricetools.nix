{
  pkgs,
  inputs,
  ...
}: {
  home.packages = [
    inputs.matugen.packages.${pkgs.system}.default
  ];
}
