{
  config,
  pkgs,
  ...
}: {
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    neovim
    wget
    alacritty
    fastfetch
    btop
    curl
    vscode
    nixd
    alejandra
    nerd-fonts.jetbrains-mono
    vazir-fonts
    google-chrome
    postman
    gnumake
    gnome-keyring
  ];
}
