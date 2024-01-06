{
  config,
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs;
  with inputs.hyprcontrib.packages.${pkgs.system};
  with inputs.eww-tray.packages.${pkgs.system};
  with inputs.hyprpicker.packages.${pkgs.system}; [
    inputs.watershot.packages.${pkgs.system}.default
    eww-wayland
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
    networkmanagerapplet
  ];
  imports = [
    ./hyprland
    ./wlsunset
    ./wlogout
    ./waybar
    ./swayosd
    ./hyprland
    ./cliphist
    ./swayidle
  ];
}
