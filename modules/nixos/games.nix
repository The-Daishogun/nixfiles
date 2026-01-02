{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    steam-run
  ];
  programs.steam = {
    enable = true;
  };
  programs.gamemode.enable = true;
}
