{ pkgs, ...}: {
  imports = [
    ./extensions.nix
    ./settings.nix
  ];

  home.packages = with pkgs; [
    networkmanager-openvpn
  ];
}
