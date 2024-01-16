{pkgs, ...}: {
  programs.nixvim = {
    colorschemes.gruvbox = {
      enable = true;
      improvedWarnings = true;
      improvedStrings = true;
      italicizeComments = true;
    };
  };
}
