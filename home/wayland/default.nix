{
  config,
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs;
  with inputs.hyprcontrib.packages.${pkgs.system};
  with inputs.watershot.packages.${pkgs.system};
  with inputs.eww-tray.packages.${pkgs.system};
  with inputs.hyprpicker.packages.${pkgs.system}; [
    eww-wayland
    watershot
    hyprpicker
    libnotify
    kooha
    handbrake
    kitty
    dunst
    wl-clipboard
    wl-clip-persist
    socat
    jq
    brightnessctl
    gnome3.gnome-control-center
    gnome3.gnome-settings-daemon
    wlogout
    swww
    grim
    slurp
  ];
  imports = [
    ./hyprland
  ];
}
