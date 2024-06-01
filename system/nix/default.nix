{ config
, pkgs
, inputs
, lib
, ...
}: {
  # borrowed from fufexan
  imports = [
    ./nh.nix
    ./nixpkgs.nix
    ./subs.nix
  ];

  # we need git for flakes
  environment.systemPackages = with pkgs; [ git ];

  nix = {
    # pin the registry to avoid downloading and evaling a new nixpkgs version every time
    registry = lib.mapAttrs (_: v: { flake = v; }) inputs;

    # set the path for channels compat
    nixPath = lib.mapAttrsToList (key: _: "${key}=flake:${key}") config.nix.registry;

    settings = {
      warn-dirty = false;
      auto-optimise-store = true;
      builders-use-substitutes = true;
      experimental-features = [ "nix-command" "flakes" ];
      flake-registry = "/etc/nix/registry.json";

      # for direnv GC roots
      keep-derivations = true;
      keep-outputs = true;

      trusted-users = [ "root" "@wheel" ];
    };

  };
}
