{ config, pkgs, ... }:


{
	environment.systemPackages = with pkgs; [
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
		libreoffice-qt-fresh
		fastfetch
		yt-dlp
	];
}
