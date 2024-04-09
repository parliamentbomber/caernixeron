{config, ...}: {
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      "float, class:^(imv)$"
      "workspace special:discord silent,class:^(WebCord)$"
      "workspace special:discord silent,class:^(discord)$"
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
  };
}
