{pkgs, ...}: {
  programs.nixvim = {
    plugins = {
      persistence.enable = true;
      notify.enable = true;
      markdown-preview.enable = true;
    };
  };
}
