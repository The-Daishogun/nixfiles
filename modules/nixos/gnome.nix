{pkgs, ...}: {
  services.desktopManager.gnome.enable = true;
  services.gnome.core-developer-tools.enable = false;
  services.gnome.games.enable = false;
  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-user-docs
    gnome-music
    gnome-photos
    gnome-clocks
    gnome-console
    gnome-terminal
    gnome-contacts
    gnome-maps
    gnome-calendar
    geary
  ];
  environment.systemPackages = with pkgs; [
    gnomeExtensions.appindicator
    gnomeExtensions.autohide-battery
    gnomeExtensions.clipboard-history
    gnomeExtensions.hide-activities-button
    gnomeExtensions.persian-calendar-2
    gnomeExtensions.proxy-switcher
  ];
}
