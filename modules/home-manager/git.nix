{config, ...}: {
  programs.git = {
    enable = true;
    userName = "Mohammadreza Varasteh";
    userEmail = "varastehmr@gmail.com";
    signing.key = "/home/daishogun/.ssh/id_ed25519.pub";
    extraConfig = {
      credential.helper = "store";
    };
  };
}
