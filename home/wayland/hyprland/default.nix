{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./env.nix
    ./binds.nix
    ./execonce.nix
    ./rules.nix
    ./settings.nix
    ./modules
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.default;
    plugins = [
      inputs.hyprland-plugins.packages.${pkgs.system}.csgo-vulkan-fix
    ];
    systemd = {
      enable = true;
      extraCommands = [
      ];
    };
  };
}
