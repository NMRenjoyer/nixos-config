{ pkgs, userSettings, ... }:
{
  imports = [
    ./conferencing.nix
  ];

  environment.systemPackages = with pkgs; [
    libreoffice
  ];
}
