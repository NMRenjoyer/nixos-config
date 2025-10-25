{ config, pkgs, userSettings, ... }: 
{
  imports = [
   ./hyprland.nix
   ./waybar.nix
   ./kitty.nix
   ./mako.nix
   ./rofi.nix
   ./hyprpaper.nix
  ];

  xdg.portal = {
    enable = true;
    config.common.default = "gtk";
    extraPortals = [pkgs.xdg-desktop-portal-gtk ];
  };

  programs.rofi = {
    enable = true;
  };
  
#  programs.hyprshot = {
#    enable = true;
#  };
}
