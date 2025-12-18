{...}: {
  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    daemon.enable = true;
    flags = [
      "--disable-up-arrow"
    ];
    forceOverwriteSettings = true;
    settings = {
      style = "compact";
      enter_accept = true;
    };
  };
}
