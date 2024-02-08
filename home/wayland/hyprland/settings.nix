# ./hyprland.nix
{
  inputs,
  pkgs,
  config,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
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
      };
      dwindle = {
        pseudotile = true;
        perserve_slit = true;
        special_scale_factor = 0.9;
      };
      xwayland = {
        force_zero_scaling = true;
      };
      misc = {
        vrr = 2;
        close_special_on_empty = true;
        disable_hyrland_logo = 2;
        disable_splash_rendering = false;
        mouse_move_enables_dpms = true;
        key_press_enables_dpms = true;
        enable_swallow = true;
        swallow_regex = "^(alacritty)$";
      };
      animations = {
        enabled = true;
      };
    };
  };
}
