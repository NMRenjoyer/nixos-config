{ ... }:
{
  ### gpu ###

  # gives kernel access to intel module early in boot sequence
  boot.initrd.availableKernelModules = [ "i915" ];

  # enable OpenGL (req. by wayland)
  hardware.graphics.enable = true;

  # configure the NVIDIA driver for Wayland
  hardware.nvidia.modesetting.enable = true;       # req. by wayland
  hardware.nvidia.powerManagement.enable = true;  # power saving on the dGPU
  hardware.nvidia.prime.sync.enable = true;       # prevents screen tearing

  ### backlight ###

  # enable intel backlight discovery; requires hybrid mode in BIOS
  boot.kernelParams = [ "acpi_backlight=native" ];

  # light module for managing backlight brightness
  programs.light = {
    enable = true;
    brightnessKeys = {
      enable = true;
    };
  };
}
