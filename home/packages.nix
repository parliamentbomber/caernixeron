{ pkgs, ... }: {
  home.packages = with pkgs; [
    mpv
    gtklock
    gtklock-playerctl-module
    #jetbrains.idea-ultimate
  ];
}
