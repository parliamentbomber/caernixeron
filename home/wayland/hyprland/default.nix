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
    ./modules/monitors.nix
    ./settings.nix
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
