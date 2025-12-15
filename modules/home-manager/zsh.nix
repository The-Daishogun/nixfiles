{...}: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting = {
      enable = true;
    };
    enableCompletion = true;
    enableBashCompletion = true;
    zplug = {
      enable = true;
      plugins = [
        {
          name = "plugins/git";
          tags = ["from:oh-my-zsh"];
        }
        {
          name = "fdellwing/zsh-bat";
          tags = ["as:command"];
        }
      ];
    };
  };
}
