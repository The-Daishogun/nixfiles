{ pkgs, ...}:{
  environment.systemPackages = with pkgs; [
    clash-verge-rev
  ];
  services.v2raya.enable = true;
}