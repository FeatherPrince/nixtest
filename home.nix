{ config, pkgs, home, programs, osConfig, ... }:

{
	imports =
		[
#			./fcitx.nix
#			./themes/adwaita-dark.nix
#			./rofi.nix
#			./firefox.nix
#			./config/waybarSettings.nix
#			./config/waybarStyle.nix
		];
	# Home Manager needs a bit of information about you and the paths it should
	# manage.
	home.username = "feather";
	home.homeDirectory = "/home/feather";

#	xdg.configFile."qtile/config.py".source = ./config/qtile/qtile.py;
#	programs.wofi.enable = true;

	# This value determines the Home Manager release that your configuration is
	# compatible with. This helps avoid breakage when a new Home Manager release
	# introduces backwards incompatible changes.
	#
	# You should not change this value, even if you update Home Manager. If you do
	# want to update the value, then make sure to first check the Home Manager
	# release notes.
	home.stateVersion = "25.05"; # Please read the comment before changing.

#	programs.git = {
#		userName = { "feather" };
#		userEmail = { "" };
#		aliases = {};
#	};
#	wayland.windowManager.hyprland.systemd.enable = true;
#	programs.waybar.enable = true;

	programs.ghostty = {
		enable = true;
		settings = {
			background-opacity = 0.9;
			initial-command = "exec fish";
		};
	};



	programs.bash = {
		enable = true;
		bashrcExtra = ''
	#bashrcExtra commands executed in non all shells including non interactive ones
	'';
		shellAliases = {
			ls = "eza --icons=always -X -F=always";
			nrs = "sudo nixos-rebuild switch";
		};
	
		initExtra = ''
	#initExtra commands executed in interactive shells
	#export PS1='┌[\u@\H][\t]\n└[\w][\$]'
	#export PS1='\[\e[91;2m\]┌[\[\e[0m\]\u@\H\[\e[91;2m\]][\[\e[0m\]\t\[\e[91;2m\]]\n└[\[\e[0m\]\w\[\e[91;2m\]][\[\e[0m\]\$\[\e[91;2m\]]\[\e[0m\]'
	export PS1='\[\e[91m\]┌\[\e[91m\][\[\e[0m\]\u@\H\[\e[91m\]]\[\e[91m\][\[\e[0m\]\t\[\e[91m\]]\n\[\e[91m\]└\[\e[91m\][\[\e[0m\]\w\[\e[91m\]]\[\e[91m\][\[\e[0m\]\$\[\e[91m\]]\[\e[0m\]'
	#exec fish
	'';
	};

	programs.fish = {
			enable = true;
			shellAliases = {
			ls = "eza --icons=always -X -F=always";
#			nrs = "sudo nixos-rebuild switch";
		};
	};

	#home.pointerCursor.hyprcursor.enable = true;

	# The home.packages option allows you to install Nix packages into your
	# environment.
	home.packages  = with pkgs; [
		# # Adds the 'hello' command to your environment. It prints a friendly
		# # "Hello, world!" when run.
		wofi
		firefox

		gimp3
		blender
		inkscape

		vscodium
		git
		ghostty
		bitwarden-desktop
		discord
		obsidian
		audacious
		noisetorch
		easyeffects
		feh
		mpv
		bat
		eza
		ncdu
		skim
		libreoffice-qt-fresh
		fastfetch
		yt-dlp

		btop
		nvtopPackages.v3d

		libnotify

		hyprcursor
		rose-pine-hyprcursor
		hyprlock
		hypridle
		hyprshot
		#hyprdim
		hyprkeys
		hyprshade
		hyprpaper
		hyprpicker
		hyprland-autoname-workspaces
		hyprshell

		wlogout

		swaynotificationcenter

		pavucontrol
		font-manager

#		walker
#		bzmenu
#		iwmenu

		#fishPlugins.tide
		
		#fishplugin-tide
		
		# # It is sometimes useful to fine-tune packages, for example, by applying
		# # overrides. You can do that directly here, just don't forget the
		# # parentheses. Maybe you want to install Nerd Fonts with a limited number of
		# # fonts?
		# (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

		# # You can also create simple shell scripts directly inside your
		# # configuration. For example, this adds a command 'my-hello' to your
		# # environment:
		# (pkgs.writeShellScriptBin "my-hello" ''
		#   echo "Hello, ${config.home.username}!"
		# '')
	];

	# Home Manager is pretty good at managing dotfiles. The primary way to manage
	# plain files is through 'home.file'.
	home.file = {
		# # Building this configuration will create a copy of 'dotfiles/screenrc' in
		# # the Nix store. Activating the configuration will then make '~/.screenrc' a
		# # symlink to the Nix store copy.
		# ".screenrc".source = dotfiles/screenrc;

		# # You can also set the file content immediately.
		# ".gradle/gradle.properties".text = ''
		#   org.gradle.console=verbose
		#   org.gradle.daemon.idletimeout=3600000
		# '';
	};

	# Home Manager can also manage your environment variables through
	# 'home.sessionVariables'. These will be explicitly sourced when using a
	# shell provided by Home Manager. If you don't want to manage your shell
	# through Home Manager then you have to manually source 'hm-session-vars.sh'
	# located at either
	#
	#  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
	#
	# or
	#
	#  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
	#
	# or
	#
	#  /etc/profiles/per-user/feather/etc/profile.d/hm-session-vars.sh
	#
	home.sessionVariables = {
		# EDITOR = "emacs";
	};

	# Let Home Manager install and manage itself.
	programs.home-manager.enable = true;

#	gtk = {};
#	xdg.mimeApps.defaultApplications = {
#		"text/plain" = [ "" ];
#		"application/pdf" = [ "" ];
#		"image/*" = [ "" ];
#		"video/png" = [ "mpv.desktop" ];
#		"video/jpg" = [ "mpv.desktop" ];
#		"video/*" = [ "mpv.desktop" ];
#	};

 home.file.".icons/default".source = "${pkgs.vanilla-dmz}/share/icons/Vanilla-DMZ"; 
}
