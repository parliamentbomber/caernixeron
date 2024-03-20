{ pkgs
, inputs
, self
, ...
}: {
  home.packages = with pkgs; [
    mpv
    gtklock
    blender
    helvum
    gtklock-playerctl-module
    google-chrome
    playerctl
  ];
}
