{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/programs/steam.nix
    ../../modules/hardware.nix
    ../../overlays
    ../../modules/services
    ../../modules/programs.nix
    ../../modules/services.nix
  ];

  networking.hostName = "Nixos-Green";
  # networking.wireless.enable = true;
  networking.networkmanager.enable = true;
  # Set your time zone.
  time.timeZone = "America/Bogota";
  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  i18n.defaultLocale = "es_ES.UTF-8";
  # Packs Fonts
  fonts.packages = with pkgs; [
    nerdfonts
    fira
    work-sans
  ];
  # Enable the X11 windowing system.
  # Configure keymap in X11
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    libinput.enable = true;
    xkb.variant = "altgr-intl";
    xkb.options = "terminate:ctrl_alt_bksp";
    dpi = 96;
  };
  console.keyMap = "us";
  # libs
  # Enable CUPS to print documents.
  # services.printing.enable = true;
  users.users.krovuxdev = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager" "video" "audio" "storage"];
    packages = with pkgs; [];
  };
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    firefox
    brave
    vim
    #runtime for js
    bun
    nodejs_21
    #extracte for web
    wget
    #Control keyboard | volume
    pamixer
    playerctl
    #home-manager
  ];
  nix.settings.experimental-features = ["nix-command" "flakes"];
  system.stateVersion = "23.11"; # Did you read the comment?
}
