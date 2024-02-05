{ pkgs, ... }: {
  home.packages = with pkgs; [
    wireshark
    unityhub
    bottles
    dotnet-sdk
    lutris
  ];
}
