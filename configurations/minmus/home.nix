{
  config,
  pkgs,
  self,
  user,
  inputs,
  ...
}: {
  home = {
    username = "nixer";
    homeDirectory = "/home/nixer";
    stateVersion = "23.11";
  };
  xdg = {
    desktopEntries = {
      ckan = {
        name = "ckan";
        genericName = "ckan";
        exec = "ckan %U";
        terminal = false;
      };
    };
  };
  programs = {
    home-manager = {
      enable = true;
    };
  };
  imports = [
  ];
}
