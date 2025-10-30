{ pkgs, ... }:
{
  services.printing = {
    enable = true;
    drivers = [pkgs.hplipWithPlugin];
  };
  hardware.sane = {
    enable = true; # enable SANE scanners
    extraBackends = [ pkgs.hplipWithPlugin ];
  };
}
