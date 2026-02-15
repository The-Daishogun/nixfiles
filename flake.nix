{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dms = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixvim,
    home-manager,
    dms,
    niri,
    ...
  } @ inputs: {
    nixosConfigurations = {
      daipc = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/daipc/configuration.nix
          ./modules/nixos/pkgs/default.nix
          ./modules/nixos/nvidia.nix
          ./modules/nixos/bluetooth.nix
          ./modules/nixos/sound.nix
          ./modules/nixos/input.nix
          ./modules/nixos/xdg.nix
          ./modules/nixos/display.nix
          ./modules/nixos/gnome.nix
          ./modules/nixos/networking.nix
          ./modules/nixos/zsh.nix
          ./modules/nixos/containers.nix
          ./modules/nixos/games.nix
          ./modules/nixos/tailscale.nix
          ./modules/nixos/niri.nix
          ./modules/nixos/polkit.nix
        ];
      };
      daitoman = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/daitoman/configuration.nix
          ./modules/nixos/pkgs/default.nix
          ./modules/nixos/bluetooth.nix
          ./modules/nixos/sound.nix
          ./modules/nixos/input.nix
          ./modules/nixos/xdg.nix
          ./modules/nixos/display.nix
          ./modules/nixos/gnome.nix
          ./modules/nixos/networking.nix
          ./modules/nixos/zsh.nix
          ./modules/nixos/containers.nix
          ./modules/nixos/tailscale.nix
          # ./modules/nixos/niri.nix
          ./modules/nixos/fprintd.nix
          # ./modules/nixos/polkit.nix
        ];
      };
    };
    homeConfigurations = {
      daishogun = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = [
          nixvim.homeModules.nixvim
          # niri.homeModules.niri
          # dms.homeModules.dank-material-shell
          ./hosts/daipc/home.nix
        ];
      };
    };
  };
}
