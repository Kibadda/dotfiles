{ config, pkgs, lib, ... }: let
  cfg = config.kibadda;
in {
  config = lib.mkIf cfg.hypr.enable {
    wayland.windowManager.hyprland.settings.exec-once = [
      "${pkgs.waybar}/bin/waybar"
    ];

    programs.waybar = {
      enable = true;

      settings = {
        top = {
          layer = "top";
          position = "top";
          height = 34;

          modules-left = [ "hyprland/workspaces" ];
          modules-center = [ "custom/weather" ];
          modules-right = (lib.optional cfg.hypr.waybar.battery "battery")
            ++ (lib.optional cfg.hypr.waybar.backlight "backlight")
            ++ [ "cpu" "memory" "disk" "pulseaudio" "network" ];

          "hyprland/workspaces" = {
            format = "<span font='11'>{name}</span>";
          };

          cpu = {
            format = "<span font='11'></span> {usage}%";
            interval = 1;
          };

          memory = {
            format = "<span font='11'></span> {percentage}%";
            interval = 1;
          };

          disk = {
            format = "<span font='11'></span> {percentage_used}%";
          };

          pulseaudio = {
            format = "<span font='11'>{icon}</span> {volume}%";
            format-muted = "{volume}% <span font='11'>x</span>";
            format-icons = {
              default = [ " " " " " " ];
            };
          };

          network = {
            format-ethernet = "<span font='11'></span> {ipaddr}";
            format-wifi = "<span font='11'></span> {ipaddr}";
            format-disconnected = "Disconnected";
            interval = 5;
          };

          "custom/weather" = {
            exec = pkgs.writeShellScript "waybar-weather" (builtins.readFile ../../bin/weather-indicator.sh);
            interval = 3600;
          };

          battery = {
            format = "{capacity}% <span font='11'>{icon}</span> ";
            format-charging = "{capacity}% <span font='11'></span>";
            format-plugged = "{capacity}% <span font='11'></span>";
            format-icons = [ "" "" "" "" "" ];
            states = {
              critical = 25;
            };
          };

          backlight = {
            device = "intel_backlight";
            format = "{percent}% <span font='11'></span> ";
          };
        };

        bottom = {
          layer = "top";
          position = "bottom";
          height = 34;

          modules-left = [ "custom/spotify" ];
          modules-center = [ "custom/yubikey" ];
          modules-right = [ "clock" ];

          clock = {
            format = "{:%H:%M:%S - %d.%m.%Y}";
            interval = 1;
          };

          "custom/yubikey" = {
            exec = pkgs.writeShellScript "waybar-yubikey" (builtins.readFile ../../bin/yubikey-indicator.sh);
          };

          "custom/spotify" = {
            exec = pkgs.writeShellScript "waybar-spotify" (builtins.readFile ../../bin/spotify-indicator.sh);
            interval = 1;
          };
        };
      };

      style = ''
        * {
          font-family: ${cfg.font} Nerd Font;
          font-weight: bold;
        }

        window#waybar {
          background-color: rgba(43, 48, 59, 0.5);
          color: #FFFFFF;
        }

        #workspaces {
          background-color: #34C3A0;
        }

        #workspaces button {
          border-radius: 0;
        }

        #workspaces button.active {
          background-color: #343434;
          color: #34C3A0;
        }

        #clock,
        #custom-yubikey,
        #custom-spotify,
        #cpu,
        #memory,
        #disk,
        #pulseaudio,
        #network,
        #battery,
        #backlight {
          padding: 0 10px;
        }

        #clock {
          background-color: #64727D;
        }

        #custom-yubikey {
          background-color: #FFFF00;
          color: #000000;
        }

        #custom-spotify {
          background-color: #1DB954;
        }

        #cpu,
        #memory,
        #disk {
          background-color: #9B59B6;
        }

        #backlight {
          background-color: #ABFC13;
        }

        #pulseaudio {
          background-color: #2980B9;
        }

        #network {
          background-color: #90B1B1;
        }

        #battery {
          background-color: #2ECC71;
        }
        #battery.charging, #battery.plugged {
          background-color: #2980B9;
        }
        #battery.critical:not(.charging) {
          background-color: #F53C3C;
        }
      '';
    };
  };
}