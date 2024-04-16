{
  imports = [
    ./fonts.nix
    ./i18n.nix
    ./packages.nix
    ./security.nix
    ./services.nix
    ./users.nix
    ./ssh.nix
    ./../nix
    ./../networking
    ../../modules/home-manager
  ];
}
