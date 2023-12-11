{
  pkgs,
  home-manager,
  ...
}: {
  programs.vscode = {
    enable = true;
    enableUpdateCheck = true;
    enableExtensionUpdateCheck = true;
    extensions = with pkgs.vscode-extensions; [
      golang.go
      github.copilot
      github.github-vscode-theme
      github.vscode-github-actions
      #ms-python.python
      ms-vscode.powershell
      bbenoist.nix
    ];
    userSettings = {
      "window.titleBarStyle" = "custom";
      "editor.fontFamily" = "'Monaspace Neon', 'monospace', monospace";
      "github.copilot.enable" = {
        "*" = true;
        "plaintext" = false;
        "markdown" = true;
        "scminput" = false;
      };
    };
  };
}
