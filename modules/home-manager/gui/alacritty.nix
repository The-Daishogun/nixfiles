{...}: {
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        opacity = 0.9;
        decorations_theme_variant = "None";
        decorations = "None";
        blur = true;
        dynamic_padding = false;
        startup_mode = "Maximized";
        padding = {
          x = 10;
          y = 10;
        };
      };
      font = {
        size = 12;
        bold = {
          family = "JetBrainsMono Nerd Font";
          style = "Heavy";
        };
        bold_italic = {
          family = "JetBrainsMono Nerd Font";
          style = "Heavy Italic";
        };
        italic = {
          family = "JetBrainsMono Nerd Font";
          style = "Medium Italic";
        };
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Medium";
        };
      };
      env = {
        TERM = "xterm-256color";
      };
      cursor = {
        style = "Beam";
        vi_mode_style.shape = "Beam";
      };
      keyboard.bindings = [
        {
          key = "F12";
          action = "CreateNewWindow";
        }
        {
          key = "H";
          mods = "Super";
          action = "Hide";
        }
        {
          key = "M";
          mods = "Super";
          action = "ToggleMaximized";
        }
        {
          key = "F";
          mods = "Super";
          action = "ToggleFullscreen";
        }
      ];
    };
  };
}
