{config, ...}: {
  programs.alacritty = {
    enable = true;
    settings = {
      env = {
        TERM = "xterm-256color";
      };
      font = {
        size = 12.0;
        normal = {
          family = "Monaspace Krypton";
        };
      };
      window = {
        decorations = "none";
      };
    };
  };
}
