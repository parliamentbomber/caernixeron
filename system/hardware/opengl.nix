{pkgs, ...}: {
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      libva
      vaapiVdpau
      libvdpau-va-gl
    ];
  };
}
