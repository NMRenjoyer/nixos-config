{ pkgs, ... }:
{
  users.users.dcreetz = {
    isNormalUser = true;
    description = "David Reetz";
    extraGroups = [ 
      "networkmanager" # network managing privileges
      "wheel" # sudouser
      "scanner" # SANE scanner privileges
      "lp" # CUPS printing privileges
      "video" # allows backlight control with light
    ];
  };
}
