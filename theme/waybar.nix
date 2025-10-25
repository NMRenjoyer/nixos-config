{ config, pkgs, userSettings, ... }: 
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
	modules-left = [ "battery" "clock" ];
	modules-center = [ "hyprland/workspaces" ];
	modules-right = [ "tray" "custom/power" ];

	"hyprland/workspaces" = {
	  format = "{icon}";
          format-icons = {
            "1" = "󰎦";
            "2" = "󰎩";
            "3" = "󰎬";
            "4" = "󰎮";
            "5" = "󰎰";
            "6" = "󰎵";
            "7" = "󰎸";
            "8" = "󰎻";
            "9" = "󰎾";
	  };
	  all-outputs = false;
          on-click = "activate";
	};
	"custom/power" = {
          "format" = " ⏻ ";
	  "tooltip" = false;
          "on-click" = ''
	    case "$(echo -e "Shutdown\nReboot\nSuspend\nLogout" | rofi -dmenu -i -p "Power Menu:")" in
              "Shutdown") systemctl poweroff ;;
              "Reboot") systemctl reboot ;;
              "Suspend") systemctl suspend ;;
              "Logout") swaymsg exit # or appropriate command for your WM
	    esac
	  '';
	};
      };
    };

    style = ''
      * {
        font-size: 18px;
      }
    '';
  };
}
