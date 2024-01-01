{
  config,
  plugins,
  ...
}: {
  programs.git = {
    enable = true;
    userName = "joe swanson";
    userEmail = "109875196+caernarferon@users.noreply.github.com";
  };
}
