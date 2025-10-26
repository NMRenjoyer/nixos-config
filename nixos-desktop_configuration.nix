{ systemSettings, ... }:
{
  imports = [
    ./common_configuration.nix
    
    nixModules/steam.nix
    nixModules/${systemSettings.hostname}_gpu.nix
  ];
}
