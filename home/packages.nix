{ pkgs
, inputs
, self
, ...
}: {
  home.packages = with pkgs; [
    mpv
    gtklock
    blender
    gtklock-playerctl-module
    self.packages.${pkgs.system}.everforest-gtk-theme
  ];
}
