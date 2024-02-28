{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.hyprlock.homeManagerModules.default
  ];
  programs.hyprlock = {
    enable = true;
    general.hide_cursor = true;

    backgrounds = [
      {
        monitor = "";
        path = "/home/nixer/Downloads/Pasted image.png";
      }
    ];

    input-fields = [
      {
        monitor = "eDP-1";

        size = {
          width = 75;
          height = 25;
        };
        fade_on_empty = false;
        placeholder_text = "password maybe";
      }
    ];
    labels = [
      {
        monitor = "";
        text = "$TIME";
        font_size = 50;
        color = "rgb(255, 255, 255, 0.8)";

        position = {
          x = 0;
          y = 150;
        };
      }
    ];
  };
}
