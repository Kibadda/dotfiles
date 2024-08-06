{ lib, pkgs, config, meta, ... }: with lib; let
  cfg = config.kibadda;

  cursorModule = types.submodule {
    options = {
      name = mkOption {
        type = types.str;
      };

      package = mkOption {
        type = types.package;
      };

      size = mkOption {
        type = types.int;
        default = 24;
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

      settings = mkOption {
        type = types.attrsOf types.anything;
        default = {};
      };

      cursor = mkOption {
        type = types.nullOr cursorModule;
        default = null;
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

  packageModule = types.submodule {
    options = {
      home = mkOption {
        type = types.listOf types.package;
        default = [];
      };

      system = mkOption {
        type = types.listOf types.package;
        default = [];
      };
    };
  };

  gitModule = types.submodule {
    options = {
      email = mkOption {
        type = types.str;
        default = meta.email;
      };

      extraConfig = mkOption {
        type = types.attrsOf types.anything;
        default = {};
      };
    };
  };

  neovimModule = types.submodule {
    options = {
      dir = mkOption {
        type = types.str;
        default = "$HOME/Projects/neovim";
      };
    };
  };
in {
  imports = [
    ./hypr.nix
    ./i3.nix
    ./git.nix
    ./neovim.nix
    ./zsh.nix
    ./kitty.nix
    ./yubikey.nix
    ./dunst.nix
    ./eza.nix
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
      default = ../wallpapers/forest.png;
    };

    packages = mkOption {
      type = packageModule;
      default = {};
    };

    browser = mkOption {
      type = types.enum [ "chrome" "firefox" ];
      default = "chrome";
    };

    git = mkOption {
      type = gitModule;
      default = {};
    };

    neovim = mkOption {
      type = neovimModule;
      default = {};
    };
  };

  config = {
    environment.systemPackages = cfg.packages.system;

    home-manager.users.${meta.username}.home = {
      packages = cfg.packages.home ++ [ (if cfg.browser == "chrome" then pkgs.google-chrome else pkgs.firefox) ];
      sessionVariables = {
        BROWSER = (if cfg.browser == "chrome" then "google-chrome-stable" else "firefox");
      };
    };
  };
}
