{ pkgs, userSettings, ... }:
{
  imports = [
    ./shells.nix
  ];
   
  services.flatpak.enable = true;
  
  environment.systemPackages = with pkgs; [
    #cli utils
    wget

    #security
    proton-pass
    protonvpn-gui
  ];
}
