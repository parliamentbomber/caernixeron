# ./hyprland.nix
{ inputs
, pkgs
, config
, ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    plugins = [
      inputs.hyprspace.packages.${pkgs.system}.Hyprspace
    ];
    extraConfig = ''
      animations {
        enabled = yes

      # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

          bezier = myBezier, 0.05, 0.9, 0.1, 1.05

          animation = windows, 1, 10, myBezier, slide
          animation = windowsOut, 1, 7, default, slide
          animation = border, 1, 10, default
          animation = borderangle, 1, 8, default
          animation = fade, 1, 7, default
          animation = workspaces, 1, 6, default, slide 
      }
    '';
    settings = {
      monitor =
        map
          (
            m:
            let
              resolution = "${toString m.width}x${toString m.height}@${toString m.refreshRate}";
              position = "${toString m.x}x${toString m.y}";
            in
            "${m.name},${
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
      input = {
        accel_profile = "flat";
        kb_layout = "us";
        touchpad = {
          natural_scroll = true;
        };
        sensitivity = 0;
      };
      gestures = {
        workspace_swipe = true;
      };
      decoration = {
        rounding = 15;
      };
      dwindle = {
        pseudotile = true;
        preserve_split = true;
        special_scale_factor = 0.9;
      };
      xwayland = {
        force_zero_scaling = true;
      };
      misc = {
        vrr = 2;
        close_special_on_empty = true;
        disable_hyprland_logo = 2;
        disable_splash_rendering = false;
        mouse_move_enables_dpms = true;
        key_press_enables_dpms = true;
        enable_swallow = true;
        swallow_regex = "^(alacritty)$";
      };
    };
  };
}
