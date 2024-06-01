{ inputs
, pkgs
, ...
}: {
  imports = [
    ./env.nix
    ./binds.nix
    ./execonce.nix
    ./rules.nix
    ./settings.nix
    ../../../modules/home-manager/monitors.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.default;
    systemd = {
      enable = true;
    };
  };
  home.sessionVariables = {
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    XDG_SESSION_TYPE = "wayland";
  };
}
