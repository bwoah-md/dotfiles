{ pkgs, ... }:

{
  # Force standard HDA driver (rock-solid for Realtek ALC236)
  boot.kernelParams = [ "snd_intel_dspcfg.dsp_driver=1" ];

  # Intel CPU Microcode & Non-free Firmware
  hardware.enableRedistributableFirmware = true;
  hardware.cpu.intel.updateMicrocode = true;

  # Hardware Acceleration (Iris Xe / VA-API / Vulkan / OpenCL)
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      vpl-gpu-rt
      intel-compute-runtime
      vulkan-loader
      libva-vdpau-driver
      libvdpau-va-gl
    ];
  };

  # Compressed RAM Swap
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 50;
  };

  # Power Management & Battery Daemons
  services.thermald.enable = true;
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
}
