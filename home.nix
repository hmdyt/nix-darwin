{ pkgs, ... }: {
  home.packages = with pkgs; [
    claude-code
    google-chrome
  ];

  home.stateVersion = "24.11";
}
