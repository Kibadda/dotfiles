{ pkgs, ... }: {
  imports = [
    ../../modules/hyprland/home.nix
    ../../modules/waybar/home.nix
    ../../modules/hyprpaper.nix
    ../../modules/hyprshade/home.nix
    ../../modules/chrome.nix
  ];

  home.packages = with pkgs; [
    chiaki
  ];

  wayland.windowManager.hyprland.settings = let
    coding = "name:Coding";
    games = "name:Games";
    tools = "name:Tools";

    monitorLeft = "DP-1";
    monitorRight = "DP-3";
  in {
    env = [
      "LIBVA_DRIVER_NAME,nvidia"
      "XDG_SESSION_TYPE,wayland"
      "GBM_BACKEND,nvidia-drm"
      "__GLX_VENDOR_LIBRARY_NAME,nvidia"
      "NIXOS_OZONE_WL,1"
    ];

    cursor = {
      no_hardware_cursors = true;
    };

    monitor = [
      "${monitorLeft}, 3840x2160@60, 0x0, 1.5"
      "${monitorRight}, 2560x1440@60, 2560x0, 1"
    ];

    workspace = [
      "${coding}, monitor:${monitorRight}, default:true"
      "${games}, monitor:${monitorRight}"
      "${tools}, monitor:${monitorRight}"
      "1, monitor:${monitorLeft}"
      "2, monitor:${monitorLeft}"
      "3, monitor:${monitorLeft}"
      "4, monitor:${monitorLeft}"
      "5, monitor:${monitorLeft}"
    ];

    bind = [
      "SUPER, C, workspace, ${coding}"
      "SUPER, G, workspace, ${games}"
      "SUPER, T, workspace, ${tools}"
    ];

    windowrulev2 = [
      "workspace ${coding}, class:^(kitty)$"

      "workspace ${tools}, class:^(org.telegram.desktop)$"
      "workspace ${tools}, class:^(steam)$"
      "workspace ${games}, class:^(steam.+)$"

      "workspace ${games}, class:^(Last Epoch.x86_64)$"
      "fullscreen, class:^(Last Epoch.x86_64)"

      "stayfocused, title:^()$, class:^(steam)$"
      "minsize 1 1, title:^()$, class:^(steam)$"

      "workspace ${games}, class:^(chiaki)$"
    ];
  };
}
