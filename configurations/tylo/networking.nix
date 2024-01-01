{lib, ...}: {
  # This file was populated at runtime with the networking
  # details gathered from the active system.
  networking = {
    nameservers = [
      "8.8.8.8"
    ];
    defaultGateway = "137.184.224.1";
    defaultGateway6 = {
      address = "";
      interface = "eth0";
    };
    dhcpcd.enable = false;
    usePredictableInterfaceNames = lib.mkForce false;
    interfaces = {
      eth0 = {
        ipv4.addresses = [
          {
            address = "137.184.233.235";
            prefixLength = 20;
          }
          {
            address = "10.48.0.5";
            prefixLength = 16;
          }
        ];
        ipv6.addresses = [
          {
            address = "fe80::64d2:64ff:fe94:a873";
            prefixLength = 64;
          }
        ];
        ipv4.routes = [
          {
            address = "137.184.224.1";
            prefixLength = 32;
          }
        ];
        ipv6.routes = [
          {
            address = "";
            prefixLength = 128;
          }
        ];
      };
      eth1 = {
        ipv4.addresses = [
          {
            address = "10.124.0.2";
            prefixLength = 20;
          }
        ];
        ipv6.addresses = [
          {
            address = "fe80::c483:87ff:fe3a:8530";
            prefixLength = 64;
          }
        ];
      };
    };
  };
  services.udev.extraRules = ''
    ATTR{address}=="66:d2:64:94:a8:73", NAME="eth0"
    ATTR{address}=="c6:83:87:3a:85:30", NAME="eth1"
  '';
}
