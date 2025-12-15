{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # hyprland.url = "github:hyprwm/Hyprland";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: {
    nixosConfigurations.daipc = nixpkgs.lib.nixosSystem {
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
        ./modules/nixos/hyprland.nix
        ./modules/nixos/networking.nix
        inputs.home-manager.nixosModules.default
      ];
    };
  };
}
