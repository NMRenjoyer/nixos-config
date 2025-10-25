{ pkgs, ... }:
{
  users.users.dcreetz = {
    isNormalUser = true;
    description = "David Reetz";
    extraGroups = [ "networkmanager" "wheel" "scanner" "lp" ];
    packages = with pkgs; [
    ];
  };
  home-manager.users.dcreetz = { pkgs, ... }: {
    home.packages = [ pkgs.atool pkgs.httpie pkgs.prismlauncher ];
    programs.bash.enable = true;
    home.stateVersion = "25.05";
  };
}
