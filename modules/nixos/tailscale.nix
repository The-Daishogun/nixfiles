{...}: {
  services.tailscale.enable = true;
  # fix issue with exit-nodes
  networking.firewall.checkReversePath = "loose";
  services.tailscale.useRoutingFeatures = "both";
}
