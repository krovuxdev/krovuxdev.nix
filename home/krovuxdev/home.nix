{
  pkgs,
  config,
  changevolume,
  ...
}: {
  imports = [
    changevolume
    ../../modules/programs
    ./modules/wm
  ];
  home.packages = with pkgs; [
    # GUI Custom
    dunst
    rofi
    eww
    #Capture
    flameshot
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
    #picom
    lsd
    neofetch
    onefetch
    #Compress or descompress
    zip
    unzip
    #Video
    vlc
    peek
    #show keyboard
    screenkey
    #Copy|Paste for text
    xclip
    #RGB for pc
    #openrgb
    mission-center
    gamemode
    mangohud
    python3
    openssl
    gcc
  ];
  programs.changevolume.enable = true;
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
