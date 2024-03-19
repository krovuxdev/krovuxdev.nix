{pkgs, config, ...}:
{
nixpkgs.config.allowUnfree = true;
home.packages = with pkgs; [
	# GUI Custom
	dunst
	rofi
	eww
	# Set Background or Show Image
	feh
	#Capture
	flameshot
	#explorer
	xfce.thunar
	#jobs models
	blender-hip
	#pipewire or pulseaudio for control volume
	pavucontrol
	#chat-online
	discord
	telegram-desktop
	#editor
	neovim
	#show list file or directory or show file in terminal
	tree
	eza
	bat
	picom
	lsd
	#Compress or descompress
	zip
	unzip
    #Video
	vlc
	peek
    #show keyboard
	screenkey
	#RGB for pc
	#openrgb
    #Term
	alacritty
];

#Git Github | Gitlab
programs.git = {
    enable = true ;
	userName = "krovuxdev";
    userEmail = "62192487+krovuxdev@users.noreply.github.com";
    extraConfig = {
        user.signingkey = "62192487+krovuxdev@users.noreply.github.com";
        commit.gpgsign = true;
    };

};

#Prompt in shell
programs.starship.enable = true;

home.stateVersion = "23.11";
programs.home-manager.enable = true;
}
