{pkgs, ...}: {
  programs.uv.enable = true;
  home.packages = with pkgs; [
    jetbrains.pycharm-professional
    rPackages.pgTools
  ];
}
