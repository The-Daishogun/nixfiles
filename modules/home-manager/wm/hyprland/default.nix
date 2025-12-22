{...}: {
  imports = [
    ./quickshell.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      monitor = [
        "HDMI-A-1, 2560x1440@60, 0x0, 1"
        "DP-1, 1920x1080@60, auto, 1, transform, 3"
        "eDP-1, disabled"
      ];

      exec-once = [
        "noctalia-shell"
        "hyprlauncher -d"
      ];

      # --- Environment Variables ---
      # env = [
      #   "WLR_NO_HARDWARE_CURSORS,1" # Fixes some issues on certain GPUs
      #   "XCURSOR_THEME,${config.home.pointerCursor.name}"
      #   "XCURSOR_SIZE,${toString config.home.pointerCursor.size}"
      # ];
      #! TODO
      windowrulev2 = [
        "opacity 0.90 0.90, class:.*"
        "float, class:^(org.gnome.Calculator)$"
        "size 360 510, class:^(org.gnome.Calculator)$"
        "center, class:^(org.gnome.Calculator)$"
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
        "col.active_border" = "rgb(88c0d0) rgb(81a1c1) 45deg";
        "col.inactive_border" = "rgb(5e81ac)";
        layout = "dwindle";
        resize_on_border = true;
        hover_icon_on_border = true;
      };

      # --- Decoration ---
      decoration = {
        rounding = 10;
        active_opacity = 1.0;
        inactive_opacity = 0.9;
        dim_modal = true;
        blur = {
          enabled = true;
          size = 8;
          passes = 1;
        };
      };

      # --- Animation ---
      animations = {
        enabled = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        workspace_wraparound = true;
        animation = [
          "windows, 1, 7, myBezier, slide"
          "windowsOut, 1, 7, default, slide"
          "border, 1, 10, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        disable_scale_notification = true;
        mouse_move_enables_dpms = true;
        key_press_enables_dpms = true;
      };

      ecosystem = {
        no_update_news = true;
        no_donation_nag = true;
      };

      # --- Keybindings (SUPER is the default Mod key) ---
      # --- Keybindings (SUPER is the default Mod key) ---
      bind = [
        # Window & Session Controls
        "SUPER, W, killactive," # Close window

        # Launchers
        "SUPER, RETURN, exec, alacritty" # Launch terminal
        "SUPER, D, exec, hyprlauncher" # Launch application launcher
        "SUPER, B, exec, google-chrome-stable"
        # Web apps
        "SUPER, T, exec, google-chrome-stable --app=https://teams.microsoft.com"
        "SUPER, O, exec, google-chrome-stable --app=https://outlook.office.com"
        "SUPER, G, exec, google-chrome-stable --app=https://gemini.google.com"

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
        "L_ALT, TAB, workspace, -1"
        "L_ALT_SHIFT, TAB, workspace, +1"
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
