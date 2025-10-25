{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wget
    pavucontrol
    
    proton-pass
    protonvpn-gui

    networkmanagerapplet
    pokeget-rs
    
    libreoffice
    
    chromium
  ];
}
