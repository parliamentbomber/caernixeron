{
  pkgs,
    lib,
    ...
}: {
  services = {
    udev.packages = with pkgs; [gnome.gnome-settings-daemon];
    psd = {
      enable = true;
      resyncTimer = "10m";
    };
  };
  environment.variables = {
    EDITOR = "nvim";
    BROWSER = "google-chrome";
  };
  environment.systemPackages = with pkgs; [
    appimage-run
  ];
  boot.binfmt.registrations.appimage = {
    wrapInterpreterInShell = false;
    interpreter = "${pkgs.appimage-run}/bin/appimage-run";
    recognitionType = "magic";
    offset = 0;
    mask = ''\xff\xff\xff\xff\x00\x00\x00\x00\xff\xff\xff'';
    magicOrExtension = ''\x7fELF....AI\x02'';
  };
}
