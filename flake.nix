{
	description = "A very basic flake";

	inputs = {
			# Nixpkgs
#		nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
		nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
#		home-manager.url = "github:nix-community/home-manager";
#		home-manager.inputs.nixpkgs.follows = "nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
#		nixpkgs.url = "github:NixOS/nixpkgs";
#		home-manager.url = "github:nix-community/home-manager";
#		home-manager.inputs.nixpkgs.follows = "nixpkgs-unstable";
	};

	outputs = { self, nixpkgs, home-manager }: {
		nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [ ./configuration.nix ];
		};
	};
}