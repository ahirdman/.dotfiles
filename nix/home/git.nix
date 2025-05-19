{pkgs, ...}: {
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
    userEmail = "";
    userName = "";
    extraConfig = {
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      pull.rebase = true;
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

    extensions = [pkgs.gh-notify pkgs.gh-dash];
  };
}
