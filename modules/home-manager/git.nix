{config, ...}: {
  programs.git = {
    enable = true;
    settings = {
      user.name = "Mohammadreza Varasteh";
      user.email = "varastehmr@gmail.com";
      credential.helper = "store";
    };
  };
}
