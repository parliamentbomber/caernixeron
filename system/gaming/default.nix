{
  config,
  inputs,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    ckan
    piper
    inputs.prismlauncher.packages.${pkgs.system}.default
    inputs.nix-gaming.packages.${pkgs.system}.proton-ge
    steam-run
  ];
  nixpkgs.overlays = [
    (_: prev: {
      steam = prev.steam.override {
        extraProfile = "export STEAM_EXTRA_COMPAT_TOOLS_PATHS='${inputs.nix-gaming.packages.${pkgs.system}.proton-ge}'";
      };
    })
  ];
  programs.steam.enable = true;
}
