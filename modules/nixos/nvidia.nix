{
  lib,
  config,
  ...
}: let
  nvidiaPackage = config.hardware.nvidia.package;
in {
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia.open = lib.mkOverride 990 (nvidiaPackage ? open && nvidiaPackage ? firmware);

  # to help with suspend corruption issue
  powerManagement.enable = true;
  hardware.nvidia.powerManagement.enable = true;
  boot.kernelParams = ["nvidia.NVreg_TemporaryFilePath=/var/tmp"];
}
