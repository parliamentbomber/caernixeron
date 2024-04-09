{
  pkgs,
  lib,
  config,
  ...
}: {
  options.programs.gaming = {
    steam = {
      enable = lib.mkEnableOption "gaming";
      proton-ge.enable = lib.mkEnableOption "proton-ge";
    };
  };
  config = lib.mkMerge [
    (
      lib.mkIf
      config.programs.gaming.steam.enable
      {
        programs.steam.enable = true;
      }
    )
    (lib.mkIf config.programs.gaming.steam.proton-ge.enable
      {
        nixpkgs.overlays = lib.mkIf config.programs.gaming.steam.proton-ge.enable [
          (_: prev: {
            steam = prev.steam.override {
              extraCompatTools = [pkgs.proton-ge-bin];
            };
          })
        ];
      })
  ];
}
