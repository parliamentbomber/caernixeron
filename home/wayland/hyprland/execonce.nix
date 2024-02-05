{
  lib,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland = {
    settings = {
      exec-once = [
        "${pkgs.spotify}/bin/spotify"
        "${pkgs.webcord-vencord}/bin/webcord"
        "${pkgs.swww}/bin/swww init"
        "${pkgs.swayosd}/bin/swayosd-server"
      ];
    };
  };
}
