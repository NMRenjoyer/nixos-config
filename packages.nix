{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    lf
    wget

    ### security ###

    proton-pass
    protonvpn-gui

    networkmanagerapplet
    pokeget-rs

    ### biology ###
    
    pymol
  ];
}
