{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wget
    pavucontrol
    rofi-screenshot
    hyprshot
    ### security ###
    
    proton-pass
    protonvpn-gui
 
    firefox-devedition

    networkmanagerapplet
    pokeget-rs
    
    libreoffice
    
    chromium
    ### biology ###
  ];
}
