# Edit this configuration file to define what should be installed on

# ywqour system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, systemSettings, userSettings, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./${userSettings.browser}.nix
      
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

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

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  programs.hyprland = {
    enable = true;
#    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  };


#  Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
#  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # install zsh
  environment.shells = with pkgs; [ zsh bash ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true; # zsh is managed by home-manager, this setting is still required.

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.dcreetz = {
    isNormalUser = true;
    description = "David Reetz";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
#      kdePackages.kate
    #  thunderbird
    ];
  };
  home-manager.users.dcreetz = { pkgs, ... }: {
    home.packages = [ pkgs.atool pkgs.httpie pkgs.prismlauncher ];
    programs.bash.enable = true;
    home.stateVersion = "25.05";
#    stylix.targets.xyz.enable = false;
  };

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

  # Install and configure steam
  programs.steam = {
    enable = true;
  };
  hardware.steam-hardware.enable = true;
  
stylix = {
    enable = true;
    image = ./wallpaper.jpg;
/*    base16Scheme = {
      base00 = "edf9dc";
      base01 = "c6e994";
      base02 = "a2d558";
      base03 = "81bd29";
      base04 = "62a207";
      base05 = "478300";
      base06 = "2e6000";
      base07 = "183900";
      base08 = "ff6a72";
      base09 = "d1912d";
      base0A = "7fbc27";
      base0B = "3bd364";
      base0C = "2fc8c0";
      base0D = "61a1ff";
      base0E = "b376ff";
      base0F = "f75fce";
    };
    image = ./wallpaper.jpg;
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
	name = "JetBrainsMono Nerd Font Mono";
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
	name = "DejaVu Sans";
      };
      serif = {
        package = pkgs.dejavu_fonts;
	name = "DejaVu Serif";
      };
    };
    #cursor = {
     # package = pkgs.bibata-cursors;
      #name = "Bibata-Modern-Classic";
  */  #};
  };
# Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    lf
    wget
    pokeget-rs
    proton-pass
    protonvpn-gui
    headsetcontrol
    networkmanagerapplet
  ];
  


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
