{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;

  home.username = "daishogun";
  home.homeDirectory = "/home/daishogun";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    # Maybe you want to install Nerd Fonts with a limited number of fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };
  home.sessionVariables = {
    EDITOR = "nvim";
    NIXOS_OZONE_WL = "1";
  };

  programs.home-manager.enable = true;

  imports = [
    ## NEW
    ../../modules/home-manager/terminal
    ../../modules/home-manager/gui
    ../../modules/home-manager/wm/gnome
    ../../modules/home-manager/dev
    ../../modules/home-manager/nvim
    ../../modules/home-manager/fonts.nix
    ../../modules/home-manager/direnv.nix
  ];
}
