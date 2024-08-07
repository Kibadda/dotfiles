{ pkgs, ... }: let 
  wallpaper = ".config/hypr/wallpaper.png";
in {
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "~/${wallpaper}"
      ];
      wallpaper = [
        ",~/${wallpaper}"
      ];
    };
  };

  home.file.${wallpaper} = {
    source = ../wallpapers/forest.png;
  };

  wayland.windowManager.hyprland.settings.exec-once = [
    "${pkgs.hyprpaper}/bin/hyprpaper"
  ];
}
