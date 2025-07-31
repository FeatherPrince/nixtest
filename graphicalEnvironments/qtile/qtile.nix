{ config, ... }:

{
	services.xserver.enable = true;
	services.xserver.windowManager.qtile = { 
		enable = true;
		configFile = ./qtileConfig.py;
	};
}