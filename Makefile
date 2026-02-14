update: 
	sudo nix flake update
	
daipc:
	sudo nixos-rebuild --flake .#daipc switch

daitoman:
	sudo nixos-rebuild --flake .#daitoman switch

home:
	home-manager --flake . switch

gc: 
	# run garbage collection
	sudo nix-collect-garbage --delete-older-than 5d

fmt:
	# format the nix files in this repo
	alejandra .