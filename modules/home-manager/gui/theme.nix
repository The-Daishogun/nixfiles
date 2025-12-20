{ pkgs, lib, ...}: {
  home.packages = with pkgs; [
    papirus-icon-theme
    qogir-icon-theme
    qogir-theme
  ];
  dconf.settings = with lib.gvariant; {
    "org/gnome/desktop/interface" = {
      icon-theme = "Papirus-Dark";
      gtk-theme = "Qogir-dark";
      cursor-theme = "Qogir-cursors";
    };
  };
}