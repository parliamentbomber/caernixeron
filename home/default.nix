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
    ./git.nix
    ./zsh.nix
    ./mime.nix
    ./audio
    ./swayidle.nix
  ];
  home.stateVersion = "23.11";
}
