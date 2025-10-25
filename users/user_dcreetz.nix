{ pkgs, ... }:
{
  users.users.dcreetz = {
    isNormalUser = true;
    description = "David Reetz";
    extraGroups = [ "networkmanager" "wheel" "scanner" "lp" ];
  };
}
