{ systemSettings, ... }:
{
  imports = [
    ./${systemSettings.hostname}_hardware-configuration.nix
    systemServices/systemServices.nix
    users/users.nix
    basicUtils/basicUtils.nix
    work/work.nix

    peripherals/common_peripherals.nix

    theme/stylix.nix
    
    ./packages.nix
  ];

  system.stateVersion = "25.05";
}
