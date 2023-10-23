{config, ...}: {
  security = {
    doas = {
      enable = true;
      extraRules = [{
        users = ["nixer"];
        keepEnv = true;
      }];
    };
    rtkit.enable = true;
    polkit.enable = true;
    pam = {
      services.swaylock = {};
      services.swaylock.text = ''
        auth include login
      '';
      services.gnome-keyring.gnupg.enable = true;
      services.gnome-keyring.sshAgentAuth = true;
      services.gnome-keyring.enableGnomeKeyring = true;
    };
  };
}
