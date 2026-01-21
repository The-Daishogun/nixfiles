{lib, ...}: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    defaultKeymap = "emacs";
    history = {
      append = true;
      ignoreAllDups = true;
      ignoreDups = true;
      ignoreSpace = true;
      saveNoDups = true;
      share = true;
    };
    shellAliases = {
      "ls" = lib.mkForce "lsd -lah";
      "cat" = "bat";
      "vi" = "nvim";
      "vim" = "nvim";
    };
    sessionVariables = {
      EDITOR = "nvim";
    };
    setOptions = [
      "NO_BEEP"
      "NUMERICGLOBSORT"
    ];
    zplug = {
      enable = true;
      plugins = [
        {
          name = "Aloxaf/fzf-tab";
        }
        {
          name = "zsh-users/zsh-completions";
        }
      ];
    };
  };

  programs.bat.enable = true;

  programs.lsd = {
    enable = true;
    enableZshIntegration = true;
  };
}
