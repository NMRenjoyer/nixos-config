{ pkgs, systemSettings, ... }:
{
  networking = {
    hostName = systemSettings.hostname;
    networkmanager.enable = true;
  };
  
  environment.systemPackages = with pkgs; [
    networkmanagerapplet
  ];

  services.openssh.enable = true;
}
