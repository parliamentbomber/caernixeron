{pkgs, ...}: {
  home.packages = with pkgs; [
    mpv
    gtklock
    blender
    gtklock-playerctl-module
    #jetbrains.idea-ultimate
  ];
}
