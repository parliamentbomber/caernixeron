# ./hyprland.nix
{
  inputs,
  pkgs,
  config,
  ...
}: {
  config.monitors = {};

  wayland.windowManager.hyprland = {
    enable = true;
    enableNvidiaPatches = true;
    settings = {
      # copied from vimjoyer
      monitor =
        map
        (
          m: let
            resolution = "${toString m.width}x${toString m.height}@${toString m.refreshRate}";
            position = "${toString m.x}x${toString m.y}";
          in "${m.name},${
            if m.enabled
            then "${resolution},${position},1"
            else "disable"
          }"
        )
        (config.monitors);
    };
    general = {
      resize_on_border = true;
      hover_icon_on_border = false;
      gaps_in = 3;
      gaps_out = 12;
      border_size = 2;
      "col.active_border" = "rgb(d79921)";
      no_border_on_floating = true;
      layout = "dwindle";
    };
    decoration = {
      rounding = 15;
      blur = {
        size = 6;
      };
    };
  };
}
