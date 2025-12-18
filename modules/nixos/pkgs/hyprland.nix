{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    hyprlauncher # Application launcher/switcher
    hyprpaper
    hyprlock
  ];
}
