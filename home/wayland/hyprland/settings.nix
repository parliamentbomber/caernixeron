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
          monitor=DP-3,2560x1440@144,0x0,1
      monitor=DP-2,1920x1080@165,2560x0,1
                      workspace = 1,monitor:DP-3
            workspace = 2, monitor:DP-3
            workspace = 3, monitor:DP-3
            workspace = 4, monitor:DP-3
            workspace = 5, monitor:DP-2
            workspace = 6, monitor:DP-2
            workspace = 7, monitor:DP-2
            workspace = 8, monitor:DP-2
            workspace = 9, monitor:DP-2


                  animations {
                    enabled = yes

                  # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

                      bezier = myBezier, 0.05, 0.9, 0.1, 1.05

                      animation = windows, 1, 10, myBezier, slide
                      animation = windowsOut, 1, 7, default, slide
                      animation = border, 1, 10, default
                      animation = borderangle, 1, 8, default
                      animation = fade, 1, 7, default
                      animation = workspaces, 1, 6, default, slidevert
                  }
    '';
    settings = {
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
