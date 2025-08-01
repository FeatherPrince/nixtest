{ lib, config, pkgs, ... }:

{
	options = {
		main-user.enable
			= lib.mkEnableOption "enable user module";

		main-user.userName = lib.mkOption {
			default = "feather";
			descriptin = ''
				username
			'';
		};
	};
	config = lib.mkIf config.main-user.enable {
		users.users.${config.main-user.userName} = {
			isNormalUser = true;
			description = "main user";
			extraGroups = [ "networkmanager" "wheel" ];
			packages = with pkgs; [
			];
		};
	};
}