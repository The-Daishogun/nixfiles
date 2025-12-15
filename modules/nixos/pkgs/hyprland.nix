{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    waybar # Status bar
    alacritty # Terminal emulator
    rofi # Application launcher/switcher
    swaylock # Screen locker
    grim # Screenshot tool (capture screen)
    slurp # Screenshot tool (select region)
    wlr-randr # Output configuration utility (like xrandr for Wayland)
  ];
}
