{ config, pkgs, inputs, systemSettings, userSettings, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./${systemSettings.hostname}_hardware-configuration.nix
      basicUtils/${userSettings.browser}.nix
      users/users.nix
      systemServices/systemServices.nix
      ./packages.nix
      theme/themeSys.nix
      gaming/gaming.nix
  ];
/*
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;
*/
  networking.hostName = systemSettings.hostname; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = systemSettings.timezone;

  # Select internationalisation properties.
  i18n.defaultLocale = systemSettings.locale;

  i18n.extraLocaleSettings = {
    LC_ADDRESS = systemSettings.locale;
    LC_IDENTIFICATION = systemSettings.locale;
    LC_MEASUREMENT = systemSettings.locale;
    LC_MONETARY = systemSettings.locale;
    LC_NAME = systemSettings.locale;
    LC_NUMERIC = systemSettings.locale;
    LC_PAPER = systemSettings.locale;
    LC_TELEPHONE = systemSettings.locale;
    LC_TIME = systemSettings.locale;
  };

  # Enable GPU
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Enable Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Experimental = true; # Show battery charge of Bluetooth devices
      };
    };
  };

  services.flatpak.enable = true;
/*
  programs.hyprland = {
    enable = true;
  };
  services.displayManager.sddm.enable = true;
*/
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # install zsh
  environment.shells = with pkgs; [ zsh bash ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true; # zsh is managed by home-manager, this setting is still required.
  
  # Install Fonts
  fonts.packages = with pkgs; [
  userSettings.fontPkg
  nerd-fonts.departure-mono
];
  
  # Basic programs to reconfigure nixos
  
  # Install firefox. (managed by firefox.nix)
  # programs.firefox.enable = true;
  # Install git. (managed by home-manager)
  # programs.git.enable = true;
  # Install neovim (managed by home-manager)
  # programs.neovim.enable = true;

  # Install zoom-us;
  programs.zoom-us.enable = true;

# Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
/*  environment.systemPackages = with pkgs; [
    lf
    wget

    ### security ###

    proton-pass
    protonvpn-gui

    ### hardware interaction ###

    headsetcontrol

    ### startup processes ###

    networkmanagerapplet

    ### biology ###
    
    pymol
  ];
  */
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 25565 ];
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
