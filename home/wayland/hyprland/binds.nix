{
  config,
  pkgs,
  inputs,
  ...
}: let
  # binds $mod + [shift +] {1..10} to [move to] workspace {1..10} - stolen from fufexan
  workspaces = builtins.concatLists (builtins.genList
    (
      x: let
        ws = let
          c = (x + 1) / 10;
        in
          builtins.toString (x + 1 - (c * 10));
      in [
        "$mod, ${ws}, workspace, ${toString (x + 1)}"
        "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
      ]
    )
    10);
in {
  wayland.windowManager.hyprland = {
    settings = let
      terminal = "${pkgs.alacritty}/bin/alacritty";
      applauncher = "${inputs.anyrun.packages.${pkgs.system}.anyrun}/bin/anyrun";
      shadower = "${inputs.shadower.packages.${pkgs.system}.shadower}/bin/shadower";
      screenshot = "watershot -s | ${shadower} | wl-copy";
      guifilebrowser = "${pkgs.gnome.nautilus}/bin/nautilus";
    in {
      "$mod" = "SUPER";
      bindm = [
        "$MOD,mouse:272,movewindow"
        "$MOD,mouse:273,resizewindow"
      ];
      # wm commands
      bind = let
        clipboard = "${pkgs.cliphist}/bin/cliphist list | anyrun --show-results-immediately true --plugins ${inputs.anyrun.packages.${pkgs.system}.stdin}/lib/libstdin.so | cliphist decode | wl-copy";
      in
        [
          "$mod, Q, killactive"
          "$mod, F, fullscreen"
          "$mod, R, togglesplit"
          "$mod, O, togglefloat"
          "$mod, P, pseudo"
          "$mod SHIFT, F, fullscreen,1"
          "ALT, TAB, cyclenext"
          "$mod, P, pin"
          # programs
          "$mod, E, ${guifilebrowser}"
          "$mod, N, ${terminal}"
          "$mod, SPACE, ${applauncher}"
          #special workspaces
          "$mod, grave, togglespecialworkspace, discord"
          "$mod, TAB, togglespecialworkspace, spotify"
          "$mod, M, togglespecialworkspace, dropdown"
          # screenshotting
          "$mod, S, ${screenshot}"
          "$mod, V, ${clipboard}"
          #volume
          ", XF86AudioPlay exec, playerctl play-pause"
          ", XF86AudioPause exec, playerctl play-pause"
          ", XF86AudioMute,exec, ${pkgs.swayosd}/bin/swayosd-client --output-volume mute-toggle "
          ",XF86AudioNext, exec, playerctl next"
          ", XF86AudioPrev, exec, playerctl previous"
          #clipboard =
          #"$mod, V,
        ]
        ++ workspaces;
      binde = [
        ",XF86AudioRaiseVolume, exec, ${pkgs.swayosd}/bin/swayosd-client --output-volume raise"
        ",XF86AudioLowerVolume, exec, ${pkgs.swayosd}/bin/swayosd-client --output-volume lower"
      ];
    };
  };
}
