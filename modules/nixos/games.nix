{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    steam-run
    lutris
  ];
  programs.steam = {
    enable = true;
  };
  programs.gamemode.enable = true;
}
