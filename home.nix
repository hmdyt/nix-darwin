{ pkgs, ... }:
{
  home.packages = with pkgs; [
    claude-code
    cloudflared
    difit
    direnv
    docker
    ffmpeg
    gh
    jq
    k9s
    kubectl
    lazydocker
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
    "/opt/homebrew/bin"
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
      eval "$(direnv hook zsh)"
    '';
  };

  programs.starship = {
    enable = true;
  };

  xdg.configFile."karabiner/karabiner.json".text = builtins.toJSON {
    profiles = [
      {
        name = "Default profile";
        selected = true;
        virtual_hid_keyboard.keyboard_type_v2 = "ansi";
        simple_modifications = [
          {
            from.key_code = "caps_lock";
            to = [{ key_code = "left_control"; }];
          }
        ];
        complex_modifications.rules = [
          {
            description = "コマンドキーを単体で押したときに、英数・かなキーを送信する。（左コマンドキーは英数、右コマンドキーはかな）";
            manipulators = [
              {
                type = "basic";
                from = {
                  key_code = "left_command";
                  modifiers.optional = ["any"];
                };
                parameters."basic.to_if_held_down_threshold_milliseconds" = 100;
                to = [{ key_code = "left_command"; lazy = true; }];
                to_if_alone = [{ key_code = "japanese_eisuu"; }];
                to_if_held_down = [{ key_code = "left_command"; }];
              }
              {
                type = "basic";
                from = {
                  key_code = "right_command";
                  modifiers.optional = ["any"];
                };
                parameters."basic.to_if_held_down_threshold_milliseconds" = 100;
                to = [{ key_code = "right_command"; lazy = true; }];
                to_if_alone = [{ key_code = "japanese_kana"; }];
                to_if_held_down = [{ key_code = "right_command"; }];
              }
            ];
          }
        ];
      }
    ];
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
