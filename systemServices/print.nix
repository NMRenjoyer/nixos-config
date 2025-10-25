{ pkgs, ... }:
{
  services.printing.enable = true;
  hardware.sane = {
    enable = true; # enable SANE scanners
    extraBackends = [ pkgs.hplipWithPlugin ];
#    disabledDefaultBackends = [ "escl" ];
  };
#  services.udev.packages = [ pkgs.sane-airscan ];
#  services.ipp-usb.enable = true;
}
