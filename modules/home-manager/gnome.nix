{ pkgs, ...}: {
  dconf.enable = true;
  dconf.settings = {
    "org/gnome/desktop/interface/color-scheme" = "prefer-dark";
    "org/gnome/desktop/interface" = {
      accent-color = "green";
    };
    "org/gnome/desktop/input-sources" = {
      xkb-options = [ "ctrl:nocaps" ];
    };
    "org/gnome/shell" = {
        # disable-user-extensions = true; # Optionally disable user extensions entirely
        enabled-extensions = with pkgs; [
          gnomeExtensions.appindicator.extensionUuid
          gnomeExtensions.autohide-battery.extensionUuid
          gnomeExtensions.clipboard-history.extensionUuid
          gnomeExtensions.hide-activities-button.extensionUuid
          gnomeExtensions.persian-calendar-2.extensionUuid
          gnomeExtensions.proxy-switcher.extensionUuid
        ];
      };
  };

  qt = {
    enable = true;
    platformTheme = "qtct";
    style = "kvantum";
  };

  xdg.configFile = {
    "Kvantum/ArcDark".source = "${pkgs.arc-kde-theme}/share/Kvantum/ArcDark";
    "Kvantum/kvantum.kvconfig".text = "[General]\ntheme=ArcDark";
  };
}