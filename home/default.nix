{ config
, inputs
, pkgs
, ...
}: {
  imports = [
    inputs.spicetify-nix.homeManagerModule
    inputs.anyrun.homeManagerModules.default
    inputs.nixvim.homeManagerModules.nixvim
    ../modules/home-manager
    ./gtk.nix
    ./vscode.nix
    ./obs.nix
    ./packages.nix
    ./spicetify.nix
    ./starship.nix
    ./anyrun.nix
    ./git.nix
    ./zsh.nix
    ./mime.nix
    ./audio
    ./wayland
    ./programs
  ];
  home.stateVersion = "23.11";
}
