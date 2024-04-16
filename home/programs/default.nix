{ pkgs, ... }: {
  imports = [
    ./cli
    ./services
    ./browsers
    ./discord.nix
    ./alacritty
  ];
  home.packages = with pkgs; [
    overskride
    mission-center
  ];
}
