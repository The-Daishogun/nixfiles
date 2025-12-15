{
  config,
  inputs,
  pkgs,
  ...
}: {
  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    withUWSM = true;
    xwayland.enable = true;
    settings = {
      # --- Monitor Configuration ---
      monitor = [
        # Example: Primary monitor
        ", auto, auto, auto"
        # If you have multiple monitors, add them here:
        # "HDMI-A-1, 1920x1080@60, 0x0, 1"
      ];

      # --- Autostart Programs ---
      exec-once = [
        "waybar"
        "hyprpaper" # Wallpaper manager (configure below)
        "swayidle -w timeout 300 'swaylock -f -c 000000' timeout 600 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on' before-sleep 'swaylock -f -c 000000'"
      ];

      # --- Environment Variables ---
      env = [
        "WLR_NO_HARDWARE_CURSORS,1" # Fixes some issues on certain GPUs
        "XCURSOR_THEME,${config.home.pointerCursor.name}"
        "XCURSOR_SIZE,${toString config.home.pointerCursor.size}"
      ];

      # --- Window Rules ---
      windowrulev2 = [
        "float,class:^(org.gnome.Calculator)$"
        "forceinput,class:^(alacritty)$"
        "tile,class:^(Brave-browser)$"
      ];

      # --- Input Configuration (Keyboard & Mouse) ---
      input = {
        kb_layout = "us";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = true;
        };
        sensitivity = 0.5; # -1.0 to 1.0, 0.0 means no modification.
      };

      # --- General Settings ---
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        "col.active_border" = "rgb(88c0d0) rgb(81a1c1) 45deg"; # Nice Nordic colors
        "col.inactive_border" = "rgb(5e81ac)";
        layout = "dwindle";
      };

      # --- Decoration ---
      decoration = {
        rounding = 10;
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
        };
        drop_shadow = true;
        shadow_range = 4;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";
      };

      # --- Animation ---
      animations = {
        enabled = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 7, myBezier, slide"
          "windowsOut, 1, 7, default, slide"
          "border, 1, 10, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      # --- Keybindings (SUPER is the default Mod key) ---
      # --- Keybindings (SUPER is the default Mod key) ---
      bind = [
        # Window & Session Controls
        "SUPER, Q, killactive," # Close window
        "SUPER, M, exit," # Exit Hyprland
        "SUPER, C, togglefloating," # Toggle window float
        "SUPER, P, pseudo, " # Pseudo-tiling
        "SUPER, J, togglesplit," # Toggle dwindle split

        # Launchers
        "SUPER, RETURN, exec, alacritty" # Launch terminal
        "SUPER, D, exec, rofi -show drun" # Launch application launcher

        # Screenshot
        "SUPER, S, exec, grim -g \"$(slurp)\"" # Capture selected area to file

        # Focus Movement
        "SUPER, left, movefocus, l"
        "SUPER, right, movefocus, r"
        "SUPER, up, movefocus, u"
        "SUPER, down, movefocus, d"

        # Workspace Switching (1-9)
        "SUPER, 1, workspace, 1"
        "SUPER, 2, workspace, 2"
        "SUPER, 3, workspace, 3"
        "SUPER, 4, workspace, 4"
        "SUPER, 5, workspace, 5"
        "SUPER, 6, workspace, 6"
        "SUPER, 7, workspace, 7"
        "SUPER, 8, workspace, 8"
        "SUPER, 9, workspace, 9"

        # Scroll between workspaces
        "SUPER, mouse_down, workspace, e+1"
        "SUPER, mouse_up, workspace, e-1"
      ];

      # --- Keybindings with Modifiers (bindm) ---
      bindm = [
        # Move focused window to a workspace (SHIFT + 1-9)
        "SUPER_SHIFT, 1, movetoworkspace, 1"
        "SUPER_SHIFT, 2, movetoworkspace, 2"
        "SUPER_SHIFT, 3, movetoworkspace, 3"
        "SUPER_SHIFT, 4, movetoworkspace, 4"
        "SUPER_SHIFT, 5, movetoworkspace, 5"
        "SUPER_SHIFT, 6, movetoworkspace, 6"
        "SUPER_SHIFT, 7, movetoworkspace, 7"
        "SUPER_SHIFT, 8, movetoworkspace, 8"
        "SUPER_SHIFT, 9, movetoworkspace, 9"

        # Mouse bindings for moving/resizing windows
        "SUPER, mouse:272, movewindow" # Click left mouse button (272) to drag
        "SUPER, mouse:273, resizewindow" # Click right mouse button (273) to resize
      ];
    };
    services.hyprpaper = {
      enable = true;
      settings = {
        # Change this path to your desired wallpaper location
        splash = ["wallpaper,${config.xdg.home}/Pictures/wallpaper.jpg"];
        # Example: set the 'wallpaper' defined above to all monitors
        wallpaper = ["all,wallpaper"];
      };
    };

    # 4. Optional: Set a cursor theme and size (Hyprland requires this for XWayland apps)
    home.pointerCursor = {
      package = pkgs.nordzy-cursor-theme;
      name = "Nordzy-cursors";
      size = 24;
    };
  };
}
