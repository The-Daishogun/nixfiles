{ config, pkgs, ... }:
{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  programs.nix-ld.enable = true;
  networking.hostName = "daitoman";
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
    packages = with pkgs; [ ];
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
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

}
