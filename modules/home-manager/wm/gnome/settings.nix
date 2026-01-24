{lib, ...}: {
  dconf.enable = true;
  dconf.settings = with lib.gvariant; {
    "org/gnome/desktop/interface" = {
      accent-color = "green";
      color-scheme = "prefer-dark";
      show-battery-percentage = true;
      enable-hot-corners = false;
      clock-show-weekday = true;
    };
    "org/gnome/desktop/input-sources" = {
      sources = [
        (mkTuple ["xkb" "us"])
        (mkTuple ["xkb" "ir"])
      ];
      xkb-options = ["ctrl:nocaps"];
    };
    "org/gnome/shell" = {
      favorite-apps = [
        "google-chrome.desktop"
        "code.desktop"
        "org.gnome.Nautilus.desktop"
      ];
    };
    "org/gnome/mutter" = {
      workspaces-only-on-primary = false;
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Super>F12";
      command = "alacritty";
      name = "terminal";
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      binding = "<Super>b";
      command = "google-chrome-stable";
      name = "browser";
    };
    "org/gnome/desktop/wm/keybindings" = {
      close = [
        "<Super>w"
      ];
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
    };
    "org/gnome/settings-daemon/plugins/power" = {
      sleep-inactive-ac-type = "nothing";
    };
    "org/gnome/desktop/session" = {
      idle-delay = mkInt32 [900];
    };
    "org/gnome/shell/extensions/persian-calendar" = {
      startup-notification = false;
      position = "center";
      widget-format = "%d %MM";
    };
    # "org/gnome/shell/extensions/dash-to-dock" = {
    #   dash-max-icon-size = 32;
    #   show-show-apps-button = false;
    #   show-trash = false;
    #   show-mounts = false;
    #   hot-keys = false;
    #   click-action = "focus-minimize-or-appspread";
    # };
    "org/gnome/shell/extensions/paperwm" = {
      open-window-position = 3;
      window-gap = 10;
      selection-border-size = 5;
      selection-border-radius-bottom = 5;
      selection-border-radius-top = 5;
      vertical-margin = 10;
      vertical-margin-bottom = 10;
      show-open-position-icon = false;
    };
  };
}
