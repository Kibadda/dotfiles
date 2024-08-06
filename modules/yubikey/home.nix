{ lib, config, meta, inputs, pkgs, ... }: with lib; let
  cfg = config.kibadda;
in {
  home = {
    packages = [] ++ (optional cfg.hypr.enable inputs.pinentry.defaultPackage.${pkgs.system});

    sessionVariables = {
      KEYID = meta.keyid;
    };
  };

  programs.gpg.enable = true;

  services = {
    dunst.settings.yubikey-touch-detector = {
      appname = "yubikey-touch-detector";
      skip_display = true;
      skip_history = true;
    };

    gpg-agent = {
      enable = true;
      enableExtraSocket = true;
      enableSshSupport = true;
      defaultCacheTtl = 60;
      maxCacheTtl = 120;
      pinentryPackage = (if cfg.hypr.enable then inputs.pinentry.defaultPackage.${pkgs.system} else pkgs.pinentry-qt);
    };
  };
}
