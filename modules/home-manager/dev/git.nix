{...}: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Mohammadreza Varasteh";
        email = "varastehmr@gmail.com";
        signingkey = "/home/daishogun/.ssh/id_ed25519.pub";
      };
      color.ui = "auto";
      init.defaultBranch = "main";
      rerere.enable = true;
      help.autocorrect = 10;
      branch.sort = "-committerdate";
      fetch.prune = true;
      gpg.format = "ssh";
      push.autoSetupRemote = true;
      diff.algorithm = "histogram";
      commit.gpgSign = true;
      credential.helper = "store";
    };
  };
}
