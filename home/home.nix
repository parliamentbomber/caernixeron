{
  config,
  pkgs,
  self,
  user,
  ...
}: {
  home = {
    username = "nixer";
    homeDirectory = "/home/nixer";
    stateVersion = "23.05";
  };

  programs = {
    home-manager = {
      enable = true;
    };
  };
  imports = [
    ./gtk.nix
  ];
}
