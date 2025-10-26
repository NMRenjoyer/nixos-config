{ systemSettings, ... }:
{
  imports = [
    ./print.nix
    ./bluetooth.nix
    ./sound.nix
    ./keyboard.nix
  ];
}
