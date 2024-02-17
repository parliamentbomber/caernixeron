{
  pkgs,
  inputs,
  config,
  ...
}: {
  imports = [
    inputs.matugen.nixosModules.matugen
  ];
  home.packages = [
    inputs.matugen.packages.${pkgs.system}.default
  ];
  programs.matugen = {
    enable = true;
    variant = "dark";
    templates = {
      "something.css" = {
        # input path, here given as a file written by nix
        input_path = pkgs.writeText "something.css" ''
          * {
            color: @{primary};
            background-color: @{surface-variant};
          }
        '';

        # path will be generated in `${config.programs.matugen.theme.files}/.config/something.css`
        output_path = "~/.config/something.css";
      };
      hyprland = {
        input_path = ./templates;
        output_path = "~/.config/hypr/colors.conf";
      };
    };
  };
  home.file.".config/hypr/colors.conf".source = "${config.programs.matugen.theme.files}/.config/hypr/colors.conf";
}
