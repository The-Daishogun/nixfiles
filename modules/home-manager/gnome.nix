{ lib, pkgs, ...}: {
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
        (mkTuple [ "xkb" "us" ]) 
        (mkTuple [ "xkb" "ir" ])
      ];
      xkb-options = [ "ctrl:nocaps" ];
    };
    "org/gnome/shell" = {
        favorite-apps = [
          "google-chrome.desktop"
          "code.desktop"
          "org.gnome.Nautilus.desktop"
        ];
        enabled-extensions = with pkgs; [
          gnomeExtensions.appindicator.extensionUuid
          gnomeExtensions.autohide-battery.extensionUuid
          gnomeExtensions.clipboard-history.extensionUuid
          gnomeExtensions.hide-activities-button.extensionUuid
          gnomeExtensions.persian-calendar-2.extensionUuid
          gnomeExtensions.proxy-switcher.extensionUuid
        ];
      };
    "org/gnome/mutter" = {
      workspaces-only-on-primary = false;
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0"= {
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
  };

  qt = {
    enable = true;
    platformTheme = "qtct";
    style.name = "kvantum";
  };

  xdg.configFile = {
    "Kvantum/ArcDark".source = "${pkgs.arc-kde-theme}/share/Kvantum/ArcDark";
    "Kvantum/kvantum.kvconfig".text = "[General]\ntheme=ArcDark";
  };
}