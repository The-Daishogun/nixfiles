{...}: {
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      imports = [
        ./monitors.nix
        ./autostart.nix
      ];

      # --- Environment Variables ---
      # env = [
      #   "WLR_NO_HARDWARE_CURSORS,1" # Fixes some issues on certain GPUs
      #   "XCURSOR_THEME,${config.home.pointerCursor.name}"
      #   "XCURSOR_SIZE,${toString config.home.pointerCursor.size}"
      # ];

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
        "SUPER, W, killactive," # Close window
        "SUPER, J, togglesplit," # Toggle dwindle split

        # Launchers
        "SUPER, RETURN, exec, alacritty" # Launch terminal
        "SUPER, D, exec, hyprlauncher" # Launch application launcher

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
      ];

      # --- Keybindings with Modifiers (bindm) ---

      bindm = [
        # Mouse bindings for moving/resizing windows
        "SUPER, mouse:272, movewindow" # Click left mouse button (272) to drag
        "SUPER, mouse:273, resizewindow" # Click right mouse button (273) to resize
      ];
    };
  };
}
