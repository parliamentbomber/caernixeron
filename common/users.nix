{
  config,
  pkgs,
  ...
}: {
  users.users.nixer = {
    isNormalUser = true;
    description = "nixer";
    extraGroups = ["networkmanager" "wheel" "audio" "video" "input" "libvirtd" "docker"];
    packages = with pkgs; [];
    shell = pkgs.zsh;
  };
}
