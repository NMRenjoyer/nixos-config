{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    proton-pass
    protonvpn-cli
  ];
}
