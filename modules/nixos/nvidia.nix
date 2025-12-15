{ lib, config, ... }:
let
  nvidiaPackage = config.hardware.nvidia.package;
in{
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = lib.mkOverride 990 (nvidiaPackage ? open && nvidiaPackage ? firmware);  
}