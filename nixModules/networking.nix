{ pkgs, systemSettings, ... }:
{
  networking = {
    hostName = systemSettings.hostname;
    networkmanager.enable = true;
  };
  
  networking.firewall.allowedTCPPorts = [
    25565 #minecraft
  ];
  
  services.openssh.enable = true;
}
