{ pkgs, ... }:
{
  nix.enable = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  programs.zsh.enable = true;
  system.stateVersion = 5;
  system.primaryUser = "yuto";
  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.config.allowUnfree = true;

  users.users.yuto = {
    name = "yuto";
    home = "/Users/yuto";
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.yuto = import ./home.nix;

  homebrew = {
    enable = true;
    casks = [
      "1password"
      "ghostty"
      "google-chrome"
      "raycast"
      "visual-studio-code"
    ];
  };

  security.pam.services.sudo_local.touchIdAuth = true;

  system.defaults.NSGlobalDomain."com.apple.swipescrolldirection" = false;

  system.defaults.finder = {
    AppleShowAllExtensions = true;
    ShowPathbar = true;
    FXEnableExtensionChangeWarning = false;
  };

  system.defaults.dock = {
    orientation = "left";
    tilesize = 36;
    autohide = false;
    show-recents = false;
    persistent-apps = [
      "/Applications/Google Chrome.app"
    ];
  };
}
