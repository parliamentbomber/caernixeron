{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    bibata-cursors
    dconf
    apple-cursor
  ];

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };
  home.pointerCursor = {
    name = "macOS-Monterey";
    size = 22;
    package = pkgs.apple-cursor;
    gtk.enable = true;
  };
  gtk = {
    enable = true;
    font = {
      name = "Torus";
    };
    theme = {
      name = "Gruvbox-Dark-BL";
      package = pkgs.gruvbox-gtk-theme;
    };
  };
  home.sessionVariables.GTK_THEME = "Gruvbox-Dark-BL";
}
