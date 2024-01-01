{config, ...}: {
  security = {
    doas = {
      enable = true;
      extraRules = [
        {
          users = ["nixer"];
          keepEnv = true;
        }
      ];
    };
    rtkit.enable = true;
    polkit.enable = true;
    pam = {
      services.gtklock = {};
      services.gnome-keyring.gnupg.enable = true;
      services.gnome-keyring.sshAgentAuth = true;
      services.gnome-keyring.enableGnomeKeyring = true;
    };
  };
}
