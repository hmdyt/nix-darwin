{ pkgs, ... }:
{
  home.packages = with pkgs; [
    claude-code
    cloudflared
    colima
    difit
    docker
    ffmpeg
    gh
    jq
    k9s
    kubectl
    wget
  ];

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

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
    profiles.default.extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
    ];
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    initContent = ''
      [[ "$TERM" == "xterm-ghostty" ]] && export TERM=xterm
    '';
  };

  programs.starship = {
    enable = true;
  };

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks."ssh.yhmd.dev" = {
      user = "dev";
      proxyCommand = "cloudflared access ssh --hostname %h";
    };
  };

  home.stateVersion = "24.11";
}
