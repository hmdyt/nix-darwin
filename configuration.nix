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
      "orbstack"
      "1password"
      "discord"
      "ghostty"
      "google-chrome"
      "intellij-idea-ce"
      "karabiner-elements"
      "logi-options+"
      "obs"
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

  system.defaults.trackpad = {
    Clicking = true;  # タップでクリック
  };

  power.sleep.display = "never";

  # NAS mount
  launchd.daemons.mount-nas = {
    serviceConfig = {
      Label = "com.user.mount-nas";
      ProgramArguments = [
        "/bin/sh" "-c"
        "mkdir -p /Volumes/nas && /sbin/mount_nfs -o resvport,soft,bg,rw 192.168.0.10:/mnt/array1/nfs /Volumes/nas"
      ];
      RunAtLoad = true;
    };
  };
}
