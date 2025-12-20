{ ... }:
{
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
    exitShellOnExit = true;
    settings = {
      default_layout = "compact";
      theme = "dracula";
      show_startup_tips = false;

    };
  };
}
