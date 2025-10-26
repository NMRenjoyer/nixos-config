{ pkgs, systemSettings, ... }:
{
  home.packages = with pkgs; [
    ### CLI utils ###

    # fetch files from web address
    wget
    
    ### Hardware and Peripherals ###

    # Open-source CLI tool to manage headset settings
    headsetcontrol
    # volume control GUI
    pavucontrol

    ### Data manipulation ###

    # wayland clipboard utilities
    wl-clipboard
    # Open-source office suite
    libreoffice

    ### Alternate browsers ###

    # chromium base browser
    chromium

    ### Security ###

    # proton password manager
    proton-pass
    # protonvpn command-line interface
    protonvpn-cli

  ] ++ lib.optionals (systemSettings.hostname == "nixos-desktop") [
    ### Desktop only ###
    # minecraft launcher
    prismlauncher

    # ...
  ] ++ lib.optionals (systemSettings.hostname == "nixos-laptop") [
    ### Laptop only ###

    # Slack GUI
    slack
    # ...
  ];
}
