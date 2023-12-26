{
  config,
  pkgs,
  inputs,
  ...
}: {
  programs = {
    zsh = {
      enable = true;
      history = {
        path = "/home/nixer/.config/zsh/histfile";
      };
      shellAliases = {
        rebuild = "${inputs.nh.packages.${pkgs.system}.default}/bin/nh os switch .";
      };
    };
  };
}
