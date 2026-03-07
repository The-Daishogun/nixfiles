{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    (callPackage ./hiddify.nix {})
  ];
  networking.firewall.enable = false;
}
