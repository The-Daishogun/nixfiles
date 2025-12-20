{pkgs, ...}: {
  home.packages = with pkgs; [
    gnomeExtensions.appindicator
    gnomeExtensions.autohide-battery
    gnomeExtensions.clipboard-history
    gnomeExtensions.hide-activities-button
    gnomeExtensions.persian-calendar-2
    gnomeExtensions.proxy-switcher
    gnomeExtensions.user-themes
  ];

  dconf.settings = {
    "org/gnome/shell" = {
      enabled-extensions = with pkgs; [
        gnomeExtensions.appindicator.extensionUuid
        gnomeExtensions.autohide-battery.extensionUuid
        gnomeExtensions.clipboard-history.extensionUuid
        gnomeExtensions.hide-activities-button.extensionUuid
        gnomeExtensions.persian-calendar-2.extensionUuid
        gnomeExtensions.proxy-switcher.extensionUuid
        gnomeExtensions.user-themes.extensionUuid
      ];
    };
  };
}
