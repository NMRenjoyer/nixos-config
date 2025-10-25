{ pkgs, ... }:
{
  programs.zoom-us.enable = true;

  environment.systemPackages = with pkgs; [
    slack
  ];
}
