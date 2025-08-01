# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs,  ... }:

{
	imports =
		[ # Include the results of the hardware scan.
			/etc/nixos/hardware-configuration.nix
			./programs.nix
			./systemPackages.nix
			./greeters/greeters.nix
			./drivers.nix
			./audioServer.nix
			./disableDefaults.nix
			./mainUser.nix
		#	./sysVars.nix
		#	(import "${home-manager}/nixos")
		#	./home/home-manager.nix
			inputs.home-manager.nixosModules.default
		#	./home.nix
#			./graphicalEnvironments/gnome/gnome.nix
#			./graphicalEnvironments/qtile/qtile.nix
		];

	programs.hyprland.enable = true;
	programs.waybar.enable = true;
	services.xserver.windowManager.hypr.enable = true;
	services.xserver.enable = true;




	home-manager = {
		extraSpecialArgs = { inherit inputs; };
		backupFileExtension = "backup";
		useUserPackages = true;
		useGlobalPkgs = true;
		users = {
			feather = import ./home.nix;
		};
	};



	# Bootloader.
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	networking.hostName = "nixos"; # Define your hostname.
	# networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

	# Configure network proxy if necessary
	# networking.proxy.default = "http://user:password@proxy:port/";
	# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

	# Enable networking
	networking.networkmanager.enable = true;

	# Set your time zone.
	time.timeZone = "Europe/Warsaw";

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

	# Select internationalisation properties.
	i18n.defaultLocale = "en_US.UTF-8";

	i18n.extraLocaleSettings = {
		LC_ADDRESS = "pl_PL.UTF-8";
		LC_IDENTIFICATION = "pl_PL.UTF-8";
		LC_MEASUREMENT = "pl_PL.UTF-8";
		LC_MONETARY = "pl_PL.UTF-8";
		LC_NAME = "pl_PL.UTF-8";
		LC_NUMERIC = "pl_PL.UTF-8";
		LC_PAPER = "pl_PL.UTF-8";
		LC_TELEPHONE = "pl_PL.UTF-8";
		LC_TIME = "pl_PL.UTF-8";
	};



	# Configure keymap in X11
	services.xserver.xkb = {
		layout = "pl";
		variant = "";
	};

	# Configure console keymap
	console.keyMap = "pl2";

	# Enable CUPS to print documents.
	services.printing.enable = true;

	# Enable touchpad support (enabled default in most desktopManager).
	# services.xserver.libinput.enable = true;

	# Define a user account. Don't forget to set a password with ‘passwd’.



	# Install firefox.

	# Allow unfree packages
	nixpkgs.config.allowUnfree = true;

	# List packages installed in system profile. To search, run:
	# $ nix search wget


	# Some programs need SUID wrappers, can be configured further or are
	# started in user sessions.
	# programs.mtr.enable = true;
	# programs.gnupg.agent = {
	#   enable = true;
	#   enableSSHSupport = true;
	# };

	# List services that you want to enable:

	# Enable the OpenSSH daemon.
	# services.openssh.enable = true;

	# Open ports in the firewall.
	# networking.firewall.allowedTCPPorts = [ ... ];
	# networking.firewall.allowedUDPPorts = [ ... ];
	# Or disable the firewall altogether.
	# networking.firewall.enable = false;

	# This value determines the NixOS release from which the default
	# settings for stateful data, like file locations and database versions
	# on your system were taken. It‘s perfectly fine and recommended to leave
	# this value at the release version of the first install of this system.
	# Before changing this value read the documentation for this option
	# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
	system.stateVersion = "24.11"; # Did you read the comment?

}
