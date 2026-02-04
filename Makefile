update: 
	sudo nix flake update
	
daipc:
	sudo nixos-rebuild --flake .#daipc switch

gc: 
	# run garbage collection
	sudo nix-collect-garbage --delete-older-than 5d

fmt:
	# format the nix files in this repo
	alejandra .