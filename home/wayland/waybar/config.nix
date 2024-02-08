{ pkgs

, lib
, ...
}: {
  programs.waybar = {
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 38;
        spacing = 3;
        exclusive = true;
        modules-left = [
          "privacy"
        ];
        modules-middle = [
          "clock"
          "hyprland/workspaces"
        ];
        modules-right = [
          "group/power"
        ];
        "group/group-power" = {
          orientation = "inherit";
          drawer = {
            "transition-duration" = 500;
            "children-class" = "not-power";
            "transition-left-to-right" = false;
          };
          modules = [
            "custom/power"
            "custom/quit"
            "custom/lock"
            "custom/reboot"
          ];
        };

        "custom/quit" = {
          format = "󰗼";
          tooltip = false;
          "on-click" = "hyprctl dispatch exit";
        };
        "custom/lock" = {
          format = "󰍁";
          tooltip = false;
          "on-click" = "swaylock";
        };
        "custom/reboot" = {
          format = "󰜉";
          tooltip = false;
          "on-click" = "reboot";
        };
        "custom/power" = {
          format = "";
          tooltip = false;
          "on-click" = "shutdown now";
        };

        "privacy" = {
          privacy = {
            modules = [
              "screenshare"
              "audio-in"
              "audio-out"
            ];
          };
        };
        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            "1" = "󰪃";
            "2" = "󰩾";
            "3" = "󰪁";
            "4" = "󰪂";
            "5" = "󰪇";
            "6" = "󰪆";
            "7" = "󰩽";
            "8" = "󰩿";
            "9" = "󰪄";
            "10" = "󰪈";
          };
        };
      };
    };
  };
}


