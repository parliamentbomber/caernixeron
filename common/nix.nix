{config, ...}: {
  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
      allowed-users = ["@wheel" "nixer"];
      auto-optimise-store = true;
      substituters = [
        "https://anyrun.cachix.org"
        "https://hyprland.cachix.org"
      ];
      trusted-public-keys = [
        "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
}
