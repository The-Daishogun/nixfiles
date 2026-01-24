{pkgs, ...}: {
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
    telegram-desktop
    unrar
    zip
    yt-dlp
    tsocks
  ];
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
    ];
  };
}
