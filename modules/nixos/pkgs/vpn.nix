{ pkgs, ...}:{
  environment.systemPackages = with pkgs; [
    clash-verge-rev
  ];
  services.v2raya.enable = true;
  services.v2raya.cliPackage = pkgs.xray;
  networking.firewall.enable = false;
}