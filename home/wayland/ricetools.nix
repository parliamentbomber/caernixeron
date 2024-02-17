{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    pywal
  ];
}
