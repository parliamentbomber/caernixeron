{pkgs, ...}: {
  programs.nixvim = {
    plugins = {
      trouble.enable = true;
      lspkind.enable = true;
      lsp-lines.enable = true;
      lspsaga.enable = true;
      lsp-format.enable = true;
    };
  };
}
