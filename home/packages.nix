{ pkgs
, inputs
, self
, ...
}: {
  home.packages = with pkgs; [
    mpv
    google-chrome
    playerctl
    blender
  ];
}
