{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    escapeTime = 0;
    clock24 = true;
    mouse = true;
    resizeAmount = 5;
    sensibleOnTop = false;
    historyLimit = 50000;
    keyMode = "vi";
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "tmux-256color";
    plugins = with pkgs; [
      tmuxPlugins.yank
      tmuxPlugins.vim-tmux-navigator
    ];
    extraConfig = ''
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel

      # Shift arrow to switch windows
      bind -n S-Left  previous-window
      bind -n S-Right next-window

      # Alt vim keys to switch windows
      bind -n M-H previous-window
      bind -n M-L next-window

      set -g @sessionx-bind s
      set -g @thumbs-key v

      # Enable undercurl
      set -as terminal-overrides ',*:Smulx=\E[4::%p1%dm'

      # Enable undercurl colors
      set -as terminal-overrides ',*:Setulc=\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'

      set -as terminal-features ",*:RGB"
      set -ag terminal-overrides ",xterm-256color:RGB"

      # Set new panes to open in current directory
      bind c new-window -c "#{pane_current_path}"
      bind '"' split-window -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"

      set-option -g renumber-windows on
      set -g status-position top

      set-option -g status-left-length 100
      set-option -g status-left " #{session_name}  "
      set-option -g status-right ""
      set-option -g status-style "fg=#ebdbb2 bg=#121212"

      # set-option -ag status-right "#[fg=red,dim,bg=white]#(uptime | cut -f 4-5 -d ' ' | cut -f 1 -d ',') "
      # set-option -g window-status-format "#[fg=#ebdbb2,bg=#AB9881]#{window_index} #{window_name} #{window_flags}"
      # set-option -g window-status-current-format "#{window_index} #{window_name} #{window_flags}"

      set-option -g window-status-format "#{window_index}:#{window_name} [#{window_flags}]"
      set-option -g window-status-current-format "#{window_index}:#{window_name} [#{window_flags}]"
      set-option -g window-status-current-style "fg=#e78a4e bold"
      set-option -g window-status-activity-style none

      set -g pane-border-style 'fg=#141617'
      set -g pane-active-border-style 'fg=#ebdbb2'

      set -g message-style 'fg=#e78a4e bg=#1d2021 bold'
    '';
  };
}
