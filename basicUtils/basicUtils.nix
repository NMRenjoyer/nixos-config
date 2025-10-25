{ pkgs, userSettings, ... }:
{
  imports = [
    ./${userSettings.browser}.nix
    ./shells.nix
  ];
   
  services.flatpak.enable = true;
  
  environment.systemPackages = with pkgs; [
    #cli utils
    wget

    #security
    proton-pass
    protonvpn-gui

    # alternate browser
    chromium
  ];
}
