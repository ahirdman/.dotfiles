{config, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      v = "nvim";
      g = "git";
      switch = "darwin-rebuild switch --flake ~/.config/nix-darwin#work";

      ".." = "cd ..";
      "..." = "cd ../..";

      cl = "clear";

      ls = "eza -la --icons --git --group-directories-first";
      lt = "eza --tree --level=2 --icons --all --ignore-glob='node_modules' ";

      glt = "git log --oneline --decorate --graph --all";
      glta = "git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' --all";
      coa = "git add -A && git commit -m";
      gc = "clone";
      gb = "switchBranch";
      gp = "git pull";
      pr = "gh pr list | cut -f1,2 | gum choose | cut -f1 | xargs gh pr checkout";
      gclean = "git branch | cut -c 3- | gum choose --no-limit | xargs git branch -D";
      gpick = "git log --oneline | gum filter | cut -d' ' -f1 # | copy";

      cat = "bat";

      ts = "tmuxPickSession";
    };

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    profileExtra = "eval $(/opt/homebrew/bin/brew shellenv)";

    initExtra = ''
      eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/base.toml)"
      eval "$(direnv hook zsh)"
      eval "$(zoxide init zsh)"
    '';

    localVariables = {
      MANPAGER = "sh -c 'col -bx | bat -l man -p'";
      BAT_THEME = "1337";
      NULLCMD = "bat";

      EDITOR = "nvim";
      ZVM_VI_EDITOR = "nvim";
      ZVM_CURSOR_STYLE_ENABLED = false;

      GUM_INPUT_CURSOR_FOREGROUND = "#ff6d12";
      GUM_INPUT_PROMPT_FOREGROUND = "#fff2eb";
      GUM_INPUT_PLACEHOLDER = "...";
      GUM_INPUT_PROMPT = " ";
      GUM_INPUT_WIDTH = 80;
      FZF_DEFAULT_OPTS = ''
        --height 40%
        --tmux bottom,40%
        --layout reverse

        --color=fg:-1:,fg+:#fbf1c7,bg:-1,bg+:#1F1F1F
        --color=gutter:#000000
        --color=hl:#a9b665,hl+:#e78a4e
        --color=info:#665c54

        --prompt=' '
        --color=prompt:#fbf1c7

        --marker='>'
        --color=marker:#a9b665

        --pointer=''
        --color=pointer:#e78a4e

        --separator='─'

        --scrollbar='│'
        --color=scrollbar:#665c54
      '';
    };
  };

  programs.fzf.enableZshIntegration = true;
}
