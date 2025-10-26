{ pkgs, ... }:
{
  environment.shells = with pkgs; [ zsh bash ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true; # zsh is managed by home-manager, this setting is still required.
}
