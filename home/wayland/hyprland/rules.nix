{config, ...}: {
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      "float, class:^(imv)$"
      "workspace special:discord silent,class:^(WebCord)$"
      "workspace special:spotify silent,title:^(Spotify Free)$"
      "stayfocused, title:^()$,class:^(steam)$"
      "minsize 1 1, title:^()$,class:^(steam)$"
    ];
    layerrule = let
      layers = "^(anyrun|gtk-layer-shell)$";
    in [
      "blur, ${layers}"
      "ignorealpha 0.2, ${layers}"
    ];
    workspace = [
      "workspace = 1,monitor:DP-3"
      "workspace = 2, monitor:DP-3"
      "workspace = 3, monitor:DP-3"
      "workspace = 4, monitor:DP-3"
      "workspace = 5, monitor:DP-2"
      "workspace = 6, monitor:DP-2"
      "workspace = 7, monitor:DP-2"
      "workspace = 8, monitor:DP-2"
      "workspace = 9, monitor:DP-2"
    ];
  };
}
