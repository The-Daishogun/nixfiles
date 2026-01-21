{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.edk2-uefi-shell.enable = true;
  boot.loader.systemd-boot.windows = {
    "11" = {
      efiDeviceHandle = "HD0b";
      title = "Windows 11 Professional";
      sortKey = "z_windows";
    };
  };
  boot.loader.systemd-boot.configurationLimit = 4;
  boot.loader.efi.canTouchEfiVariables = true;

  programs.nix-ld.enable = true;

  networking.hostName = "daipc";

  time.timeZone = "Asia/Tehran";
  i18n.defaultLocale = "en_US.UTF-8";

  users.users.daishogun = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "daishogun";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
    packages = with pkgs; [
    ];
  };

  environment.pathsToLink = [
    "/share/zsh"
  ];

  nixpkgs.config.allowUnfree = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    persistent = true;
    options = "--delete-older-than 5d";
  };
  system.stateVersion = "25.11";
  nix.settings.experimental-features = ["nix-command" "flakes"];

  fileSystems = let
    ntfs-drives = [
      "/storage/win"
    ];
  in
    lib.genAttrs ntfs-drives (path: {
      options = [
        "uid=1000"
        # "nofail"
      ];
    });
}
