{
  config,
  pkgs,
  ...
}: {
  users = {
    motd = ''
     _____
    < moo >
    ----- 
            \   ^__^
             \  (oo)\_______
                (__)\       )\/\
                    ||----w |
                    ||     ||

    '';
    users.nixer = {
      isNormalUser = true;
      description = "nixer";
      extraGroups = ["networkmanager" "wheel" "audio" "video" "input" "libvirtd" "docker" "power" "nix"];
      packages = with pkgs; [];
      shell = pkgs.zsh;
    };
  };
}
