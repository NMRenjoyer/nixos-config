{ systemSettings, ... }:
{
  imports = [
    ./common_configuration.nix
    
    gaming/gaming.nix
    peripherals/${systemSettings.hostname}_gpu.nix
  ];
}
