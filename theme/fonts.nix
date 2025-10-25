{ pkgs, userSettings, ... }:
{
  fonts.packages = with pkgs; [
    userSettings.fontPkg
    nerd-fonts.departure-mono
  ];
}
