{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  programs = {
    zsh = {
      enable = true;
      defaultKeymap = "emacs";
      history = {
        path = "/home/nixer/.config/zsh/histfile";
      };
      shellAliases = {
        rebuild = "cd /home/nixer/caernixeron && ${inputs.nh.packages.${pkgs.system}.default}/bin/nh os switch .";
      };
      plugins = [
        {
          name = "zsh-syntax-highlighting";
          src = pkgs.fetchFromGitHub {
            owner = "zsh-users";
            repo = "zsh-syntax-highlighting";
            rev = "dcc99a86497491dfe41fb8b0d5f506033546a8c0";
            sha256 = "sha256-c7jLX8u5QfW4ukxYd5mBmMY5e7unDEjsvbIUxg3jnaA=";
          };
        }
      ];
    };
  };
}
