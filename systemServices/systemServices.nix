{ ... }:
{
  imports = [
    ./networking.nix
#    ./sound.nix
#    ./print.nix
    ./login.nix
    ./boot.nix
    ./localization.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
}
