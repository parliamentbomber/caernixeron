{
  inputs,
  pkgs,
  config,
  ...
}: {
  # themable spotify
  programs.spicetify = let
    spicetify-extensions = inputs.spicetify-nix.packages.${pkgs.system}.default;
  in {
    enable = true;
    enabledExtensions = with spicetify-extensions.extensions; [
      adblock
    ];
  };
}
