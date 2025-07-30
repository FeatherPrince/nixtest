{ config, pkgs, ... }:

{
	users.users.feather = {
	isNormalUser = true;
	description = "feather";
	extraGroups = [ "networkmanager" "wheel" ];
#		packages = with pkgs; [
#			vscodium
#			fish
#			git
#			ghostty
#			bitwarden
#			discord
#			bitwarden-desktop
#		];
	};
}
