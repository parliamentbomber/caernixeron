{
  config,
  inputs,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    piper
    inputs.prismlauncher.packages.${pkgs.system}.default
    steam-run
  ];
  programs = {
    steam.enable = true;
  };
}
