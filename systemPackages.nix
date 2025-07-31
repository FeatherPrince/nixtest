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
		ncdu
		skim
		libreoffice-qt-fresh
		fastfetch
		yt-dlp
	];
	fonts.packages = with pkgs; [
	nerd-fonts.hack
	#nerdfonts
	#nerd-fonts.symbols-only
	noto-fonts
	noto-fonts-emoji
	noto-fonts-monochrome-emoji
	noto-fonts-cjk-sans
	noto-fonts-cjk-serif
	openmoji-color
	openmoji-black
	twitter-color-emoji
	twemoji-color-font
	#whatsapp-emoji-font #bugged
	emojione
	unicode-emoji
	liberation_ttf
	fira-code
	fira-code-symbols
	mplus-outline-fonts.githubRelease
	dina-font
	proggyfonts
	ipafont
	ipaexfont
	weather-icons
#	noto-fonts
#	noto-fonts-lgc-plus
#	noto-fonts-cjk-sans
#	noto-fonts-cjk-serif
#	noto-fonts-color-emoji
#	noto-fonts-emoji-blob-bin
#	noto-fonts-monochrome-emoji
#	nerd-fonts.symbols-only
	];
}
