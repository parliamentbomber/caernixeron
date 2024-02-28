{ inputs
, pkgs
, config
, ...
}: {
  # themable spotify
  programs.spicetify =
    let
      spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
    in
    {
      enable = true;
      enabledExtensions = with spicePkgs.extensions; [
        #adblock - i have premium atm
      ];
    };
}
