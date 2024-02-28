{pkgs, ...}: {
  services.fprintd = {
    enable = false;
    tod = {
      enable = true;
      driver = pkgs.libfprint-2-tod1-goodix-550a;
    };
  };
}
