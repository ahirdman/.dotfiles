{...}: {
  programs.alacritty = {
    enable = true;

    settings = {
      colors = {
        normal = {
          black = "#928374";
          red = "#ea6962";
          green = "#a9b665";
          yellow = "#d8a657";
          blue = "#7daea3";
          magenta = "#d3869b";
          cyan = "#89b482";
          white = "#ebdbb2";
        };

        primary = {
          background = "#000000";
          foreground = "#FFFFFF";
        };
      };

      env = {
        TERM = "xterm-256color";
      };

      font = {
        size = 18;
        normal = {
          family = "BerkeleyMonoVariable Nerd Font";
          style = "Regular";
        };
        italic = {
          family = "BerkeleyMonoVariable Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "BerkeleyMonoVariable Nerd Font";
          style = "Regular";
        };
        bold_italic = {
          family = "BerkeleyMonoVariable Nerd Font";
          style = "Regular";
        };
      };

      window = {
        decorations = "buttonless";
        padding = {
          x = 6;
          y = 6;
        };
      };

      general = {
        live_config_reload = true;
      };
    };
  };
}
