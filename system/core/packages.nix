{pkgs, ...}: {
  nixpkgs.config = {
    allowUnfree = true;
  };
  nixpkgs.overlays = [
    (final: prev: {
      obsidian-wayland = prev.obsidian.override {electron = final.electron_24;};
    })
  ];
  programs = {
    nix-ld.enable = true;
    zsh = {
      enable = true;
    };
    seahorse = {
      enable = true;
    };
    dconf = {
      enable = true;
    };
    gnupg = {
      agent = {
        enable = true;
        enableExtraSocket = true;
      };
    };
  };
}
