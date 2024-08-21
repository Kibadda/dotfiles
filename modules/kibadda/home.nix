{ lib, pkgs, config, meta, inputs, ... }: with lib; let
  cfg = config.kibadda;

  cursorModule = types.submodule {
    options = {
      name = mkOption {
        type = types.str;
        default = "Bibata-Modern-Classic";
      };

      package = mkOption {
        type = types.package;
        default = pkgs.bibata-cursors;
      };

      size = mkOption {
        type = types.int;
        default = 18;
      };
    };
  };

  waybarModule = types.submodule {
    options = {
      battery = mkOption {
        type = types.bool;
        default = false;
      };

      backlight = mkOption {
        type = types.bool;
        default = false;
      };
    };
  };

  hyprModule = types.submodule {
    options = {
      enable = mkOption {
        type = types.bool;
        default = false;
      };

      nvidia = mkOption {
        type = types.bool;
        default = false;
      };

      monitor = mkOption {
        type = types.listOf types.str;
      };

      bind = mkOption {
        type = types.listOf types.str;
        default = [];
      };

      windowrule = mkOption {
        type = types.listOf types.str;
        default = [];
      };

      workspace = mkOption {
        type = types.listOf types.str;
        default = [];
      };

      cursor = mkOption {
        type = cursorModule;
        default = {};
      };

      waybar = mkOption {
        type = waybarModule;
        default = {};
      };
    };
  };

  i3Module = types.submodule {
    options = {
      enable = mkOption {
        type = types.bool;
        default = false;
      };
    };
  };

  gitModule = types.submodule {
    options = {
      email = mkOption {
        type = types.str;
        default = meta.email.personal;
      };

      includes = mkOption {
        type = types.listOf (types.attrsOf types.anything);
        default = [];
      };
    };
  };

  yubikeyModule = types.submodule {
    options = {
      enable = mkOption {
        type = types.bool;
        default = true;
      };

      touch-detector = mkOption {
        type = types.bool;
        default = true;
      };

      pam = mkOption {
        type = types.listOf types.str;
        default = [ "sudo" "login" ];
      };
    };
  };

  kittyModule = types.submodule {
    options = {
      enable = mkOption {
        type = types.bool;
        default = true;
      };

      size = mkOption {
        type = types.int;
        default = 10;
      };
    };
  };
in {
  imports = [
    ../hypr/home.nix
    ../i3/home.nix
    ../zsh/home.nix
    ../yubikey/home.nix
    ../git.nix
    ../kitty.nix
    ../dunst.nix
    ../eza.nix
    ../pass.nix
    ../direnv.nix
  ];

  options.kibadda = {
    hypr = mkOption {
      type = hyprModule;
      default = {};
    };

    i3 = mkOption {
      type = i3Module;
      default = {};
    };

    wallpaper = mkOption {
      type = types.path;
      default = ../../wallpapers/forest.png;
    };

    packages = mkOption {
      type = types.listOf types.package;
      default = [];
    };

    browser = mkOption {
      type = types.enum [ "chrome" "firefox" ];
      default = "chrome";
    };

    git = mkOption {
      type = gitModule;
      default = {};
    };

    yubikey = mkOption {
      type = yubikeyModule;
      default = {};
    };

    kitty = mkOption {
      type = kittyModule;
      default = {};
    };

    font = mkOption {
      type = types.str;
      default = "JetBrainsMono";
    };
  };

  config = {
    home = {
      username = meta.username;

      homeDirectory = "/home/${meta.username}";

      packages = cfg.packages
        ++ [ (if cfg.browser == "chrome" then pkgs.google-chrome else pkgs.firefox) ]
        ++ [ pkgs.font-awesome (pkgs.nerdfonts.override { fonts = [ cfg.font ]; }) ]
        ++ [ inputs.nvim.packages.${pkgs.system}.nvim-dev ];

      sessionVariables = {
        BROWSER = (if cfg.browser == "chrome" then "google-chrome-stable" else "firefox");
        NIXOS_DIR = "$HOME/.dotfiles";
        NIXVIM_DIR = "$HOME/Projects/nixvim";
      };

      sessionPath = [
        "$HOME/.local/bin"
      ];

      file.".local/bin/fetch-repositories" = {
        executable = true;
        source = ../../bin/fetch-repositories.sh;
      };
    };

    fonts.fontconfig.enable = true;

    xdg.enable = true;
  };
}
