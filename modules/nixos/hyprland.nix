{
  config,
  inputs,
  pkgs,
  ...
}: {
  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    withUWSM = true;
    xwayland.enable = true;
    # services.hyprpaper = {
    #   enable = true;
    #   settings = {
    #     # Change this path to your desired wallpaper location
    #     splash = ["wallpaper,${config.users."$USER".home}/Pictures/wallpaper.jpg"];
    #     # Example: set the 'wallpaper' defined above to all monitors
    #     wallpaper = ["all,wallpaper"];
    #   };
    # };
  };
}
