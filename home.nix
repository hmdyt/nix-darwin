{ pkgs, ... }: {
  home.packages = with pkgs; [
    claude-code
    google-chrome
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

  home.stateVersion = "24.11";
}
