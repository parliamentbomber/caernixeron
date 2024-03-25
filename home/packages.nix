{
  pkgs,
  inputs,
  self,
  ...
}: {
  home.packages = with pkgs; [
    gtklock
    blender
    helvum
    google-chrome
    playerctl
    gnome.nautilus
  ];
}
