{
  config,
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.spicetify-nix.homeManagerModule
    inputs.anyrun.homeManagerModules.default
    inputs.nixvim.homeManagerModules.nixvim
    ./gtk.nix
    ./discord.nix
    ./vscode.nix
    ./obs.nix
    ./packages.nix
    ./firefox.nix
    ./spicetify.nix
    ./starship.nix
    ./anyrun.nix
    ./git.nix
    ./zsh.nix
    ./mime.nix
    ./audio
    ./rice
    ./wayland
    ./programs
  ];
  home.stateVersion = "23.11";
}
