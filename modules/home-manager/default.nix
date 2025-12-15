inputs: {
  config,
  pkgs,
  lib,
  ...
}: let
  packages = import ../packages.nix {
    inherit pkgs lib;
  };

in {
  imports = [
    (import ./btop.nix)
    (import ./direnv.nix)
    (import ./git.nix)
    (import ./vscode.nix)
    (import ./zoxide.nix)
    (import ./zsh.nix)
  ];

  home.file = {
  };
  home.packages = packages.homePackages;
  gtk = {
    enable = true;
    theme = {
      name ="Adwaita:dark";
      package = pkgs.gnome-themes-extra;
    };
  };

  programs.neovim.enable = true;
}
