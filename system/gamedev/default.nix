{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    unityhub
    dotnet-sdk
  ];
}
