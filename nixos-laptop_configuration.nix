{ systemSettings, ... }:
{
  imports = [
    ./common_configuration.nix
    
    nixModules/nixos-laptop_gpu.nix
    nixModules/zoom.nix
  ];
}
