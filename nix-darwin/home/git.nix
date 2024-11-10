{...}: {
  programs.git = {
    enable = true;
    aliases = {
      st = "status";
      ls = "branch -v";
      co = "checkout";
      aa = "add --all";
      ap = "add --patch";
      ci = "commit -v";
      ca = "commit --amend";
      pf = "push --force-with-lease";
      pb = "!git fetch -p && git branch -vv | grep ': gone]' | awk '{print $1}' | xargs -r git branch -D";
      undo = "reset --soft HEAD^";
    };
    userEmail = "126080861+AlexHird@users.noreply.github.com";
    userName = "Alexander Hirdman";
    extraConfig = {
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      fetch.prune = true;
      core.editor = "nvim";
      commit.template = "~/.gitmessage";
    };
  };

  programs.gh = {
    enable = true;
    settings = {
      prompt = "enabled";
      editor = "nvim";
      git_protocol = "ssh";
    };
  };
}
