# desktop specific nixos options
{
  config,
  inputs,
  ...
}: {
  modules = [
    inputs.home-manager.nixosModules.default
  ];
  imports = [
    # ./vscode.nix
    # ./starship.nix
    # ./anyrun.nix
  ];
}
