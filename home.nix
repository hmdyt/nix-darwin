{ pkgs, ... }: {
  home.packages = with pkgs; [
    claude-code
    colima
    docker
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

  programs.zsh.enable = true;

  programs.starship = {
    enable = true;
  };

  home.stateVersion = "24.11";
}
