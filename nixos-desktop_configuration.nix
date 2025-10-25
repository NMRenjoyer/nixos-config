{ config, pkgs, inputs, systemSettings, userSettings, ... }:
{
  imports = [
    ./${systemSettings.hostname}_hardware-configuration.nix
    basicUtils/basicUtils.nix
    users/users.nix
    systemServices/systemServices.nix
    ./packages.nix
    theme/stylix.nix
    gaming/gaming.nix
    work/work.nix
    peripherals/${systemSettings.hostname}_peripherals.nix
  ];

  system.stateVersion = "25.05";
}
