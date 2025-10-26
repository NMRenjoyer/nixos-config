{ pkgs, ... }:
{
  services.printing.enable = true;

  hardware.sane = {
    enable = true; # enable SANE scanners
    extraBackends = [ pkgs.hplipWithPlugin ];
  };
}
