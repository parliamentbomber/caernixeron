{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    enableUpdateCheck = true;
    enableExtensionUpdateCheck = true;
    userSettings = {
      "window.titleBarStyle" = "custom";
      "editor.fontFamily" = "'Monaspace Neon', 'monospace', monospace";
      "window.zoomLevel" = 1;
      "explorer.confirmDelete" = false;
    };
  };
}
