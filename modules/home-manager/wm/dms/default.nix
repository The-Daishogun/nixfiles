{...}: {
  programs.dank-material-shell = {
    enable = true;
    enableSystemMonitoring = true; # System monitoring widgets (dgop)
    enableVPN = true; # VPN management widget
    enableDynamicTheming = true; # Wallpaper-based theming (matugen)
    enableAudioWavelength = true; # Audio visualizer (cava)
    enableCalendarEvents = true; # Calendar integration (khal)
    enableClipboardPaste = true; # Pasting items from the clipboard (wtype)
  };
  programs.niri.enable=true;
  niri-flake.cache.enable= true;
  systemd.user.services.niri-flake-polkit.enable = false;
}
