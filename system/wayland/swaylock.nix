{ pkgs
, lib
, ...
}: {
  security.pam.services = {
    swaylock = { };
    gtklock.text = lib.readFile "${pkgs.gtklock}/etc/pam.d/gtklock";
  };
}
