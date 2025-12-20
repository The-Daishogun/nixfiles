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
      binding = "<Super>Return";
      command = "alacritty";
      name = "terminal";
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
  };
}
