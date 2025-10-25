{ config, pkgs, userSettings, ... }: 
{
  imports = [
   ./hyprland.nix
   ./waybar.nix
   ./kitty.nix
   ./mako.nix
   ./rofi.nix
   ./portal.nix
   ./hyprpaper.nix
   ./hyprshot.nix
  ];
}
