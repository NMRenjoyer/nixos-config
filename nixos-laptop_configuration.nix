{ systemSettings, ... }:
{
  imports = [
    ./common_configuration.nix

    nixModules/zoom.nix
  ];
}
