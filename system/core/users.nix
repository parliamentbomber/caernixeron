{
  config,
  pkgs,
  ...
}: {
  users = {
    motd = "ain't no sunshine";
    users.nixer = {
      isNormalUser = true;
      description = "nixer";
      initialPassword = "test";
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICEvnXyYl6HjmhQ1e5nSrp+JELO4xWTo8oVZYssZ3cW4 nixer@eeloo
"
      ];

      extraGroups = ["networkmanager" "wheel" "audio" "video" "input" "docker" "power" "nix"];
      shell = pkgs.zsh;
    };
  };
}
