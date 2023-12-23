{
  config,
  inputs,
  ...
}: {
  imports = [
    inputs.spicetify-nix.homeManagerModule
    inputs.anyrun.homeManagerModules.default
    ./gtk.nix
    ./vscode.nix
    ./spicetify.nix
    ./starship.nix
    ./anyrun.nix
  ];
  home.stateVersion = "23.11";
}
