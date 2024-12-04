{
  config,
  pkgs,
  ...
}: {
  programs.fzf.enableZshIntegration = true;
  programs.zsh = {
    enable = true;

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    plugins = with pkgs; [
      {
        name = "zsh-autosuggestions";
        src = zsh-autosuggestions;
        file = "share/zsh-autosuggestions/zsh-autosuggestions.zsh";
      }
      {
        name = "zsh-completions";
        src = zsh-completions;
        file = "share/zsh-completions/zsh-completions.zsh";
      }
      {
        name = "zsh-syntax-highlighting";
        src = zsh-syntax-highlighting;
        file = "share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh";
      }
      {
        name = "vi-mode";
        src = zsh-vi-mode;
        file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
      }
    ];

    shellAliases = {
      ".." = "cd ..";
      "..." = "cd ../..";
      g = "g() { [ $# -gt 0 ] && git $@ || git status -s; };g";
      ls = "eza -la --icons --git --group-directories-first";
      lt = "eza --tree --level=2 --icons --all --ignore-glob='node_modules' ";
      v = "nvim";
      switch = "darwin-rebuild switch --flake ~/.dotfiles/nix/darwin#work";
      cl = "clear";
      cat = "bat";
      ts = "tmuxPickSession";
      gb = "switchBranch";
      gc = "clone";
      gp = "git pull";
      glt = "git log --oneline --decorate --graph --all";
      glta = "git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' --all";
      coa = "git add -A && git commit -m";
      pr = "gh pr list | cut -f1,2 | gum choose | cut -f1 | xargs gh pr checkout";
      gclean = "git branch | cut -c 3- | gum choose --no-limit | xargs git branch -D";
      gpick = "git log --oneline | gum filter | cut -d' ' -f1 # | copy";
    };

    profileExtra = "eval $(/opt/homebrew/bin/brew shellenv)";

    initExtra = ''
      function switchBranch() {
        BRANCH=$(git branch -v | gum choose | awk '{print $1}')
        git switch $BRANCH
      }

      function clone() {
        echo "# Clone Repository with SSH profile: \n" | gum format
        echo ""
        MODE=$(gum choose  "Work" "Personal")
        GIT_URL=$(gum input --placeholder "Repositry url")
        REPO=$\{GIT_URL#*:}
        PREFIX=""

        if [ "$MODE" = "Work" ]; then
          PREFIX="workgit"
        else
          PREFIX="personalgit"
        fi

        gum confirm "Clone repo?" && git clone --bare $PREFIX:$REPO
      }

      function tmuxPickSession() {
        SESSION=$(tmux list-sessions -F \#S | gum filter --placeholder "Pick session...");
        tmux switch-client -t $SESSION || tmux attach -t $SESSION
      }

      eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/base.toml)"
      eval "$(zoxide init zsh)"
    '';

    localVariables = {
      MANPAGER = "sh -c 'col -bx | bat -l man -p'";
      BAT_THEME = "1337";
      NULLCMD = "bat";

      ZVM_VI_ESCAPE_BINDKEY = "jj";

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
}
