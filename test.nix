{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    pokeget-rs
  ];
}
