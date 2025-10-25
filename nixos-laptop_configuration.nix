{ config, pkgs, inputs, systemSettings, userSettings, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./${systemSettings.hostname}_hardware-configuration.nix
      basicUtils/basicUtils.nix
      users/users.nix
      systemServices/systemServices.nix
      ./packages.nix
      theme/themeSys.nix
      gaming/gaming.nix
      work/work.nix
      peripherals/${systemSettings.hostname}_peripherals.nix
  ];

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
