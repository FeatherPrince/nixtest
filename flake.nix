{
	description = "Nixos config flake";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

		 home-manager = {
			 url = "github:nix-community/home-manager";
			 inputs.nixpkgs.follows = "nixpkgs";
		 };
	};

	outputs = { self, nixpkgs, home-manager ,... }@inputs:
		let
			system = "x86_64-linux";
			pkgs = nixpkgs.legacyPackages.${system};
		in
	{
		# use "nixos", or your hostname as the name of the configuration
		# it's a better practice than "default" shown in the video
		nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
			specialArgs = { inherit inputs; };
			modules = [
				./configuration.nix
				 inputs.home-manager.nixosModules.default
			];
		};
#		homeConfigurations."feather" = home-manager.lib.homeManagerConfiguration {
#			inherit pkgs;
#
#			# Specify your home configuration modules here, for example,
#			# the path to your home.nix.
#			modules = [ ./home.nix ];
#
#				# Optionally use extraSpecialArgs
#			# to pass through arguments to home.nix
#		};
	};
}


#{
#  description = "Home Manager configuration of feather";
#
#  inputs = {
#    # Specify the source of Home Manager and Nixpkgs.
#    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
#    home-manager = {
#      url = "github:nix-community/home-manager";
#      inputs.nixpkgs.follows = "nixpkgs";
#    };
#  };
#
#  outputs =
#    { nixpkgs, home-manager, ... }:
#    let
#      system = "x86_64-linux";
#      pkgs = nixpkgs.legacyPackages.${system};
#    in
#    {
#      homeConfigurations."feather" = home-manager.lib.homeManagerConfiguration {
#        inherit pkgs;
#
#        # Specify your home configuration modules here, for example,
#        # the path to your home.nix.
#        modules = [ ./home.nix ];
#
#        # Optionally use extraSpecialArgs
#        # to pass through arguments to home.nix
#      };
#    };
#}