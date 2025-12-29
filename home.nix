{ pkgs, ... }:
{
  home.packages = with pkgs; [
    claude-code
    colima
    difit
    docker
    fzf
  ];

  programs.lazygit = {
    enable = true;
    settings.gui.language = "en";
  };

  programs.git = {
    enable = true;
    settings.user.name = "hmdyt";
    settings.user.email = "me@hmdyt.dev";
  };

  home.sessionPath = [
    "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
  ];

  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
    ];
  };

  programs.zsh.enable = true;

  programs.starship = {
    enable = true;
  };

  home.stateVersion = "24.11";
}
