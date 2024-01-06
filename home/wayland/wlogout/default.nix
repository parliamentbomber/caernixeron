{
  config,
  inputs,
  ...
}: {
  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "reboot";
        keybind = "r";
      }
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "shutdown";
        keybind = "s";
      }
      {
        label = "suspend";
        action = "systemctl suspend";
        text = "suspend";
        keybind = "u";
      }
    ];
    style = ''
      button {
        background-repeat: no-repeat;
        background-position: center;
        background-size: 25%;
        border: none;
        background-color: rgba(30, 30, 46, 0);
        box-shadow: none;
        margin: 5px;
        font-size: 20px;
        color: #cdd6f4;
      }

      button:hover {
        background-color: rgba(49, 50, 68, 0.1);
      }

      button:focus {
        background-color: #cba6f7;
        color: #11111b;
      }
    '';
  };
}
