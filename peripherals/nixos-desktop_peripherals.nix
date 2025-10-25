{ systemSettings, ... }:
{
  imports = [
    ./print.nix
    ./sound.nix
    ./bluetooth.nix
    ./keyboard.nix
    ./${systemSettings.hostname}_gpu.nix
  ];
}
