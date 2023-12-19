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
    stateVersion = "23.05";
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
    inputs.spicetify-nix.homeManagerModule
    inputs.anyrun.homeManagerModules.default
    ./gtk.nix
    ./vscode.nix
    ./spicetify.nix
    ./starship.nix
    ./anyrun.nix
  ];
}
