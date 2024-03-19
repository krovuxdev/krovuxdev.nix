{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.supportedFilesystems = [ "ntfs" ];
  networking.hostName = "hack"; 
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
  ];
  

  # Enable the X11 windowing system.
  # Configure keymap in X11
  services.xserver = {
      enable = true;
      layout = "us";
      libinput.enable = true;
      xkbVariant = "altgr-intl";
      xkbOptions = "terminate:ctrl_alt_bksp";
      dpi = 96; 
  };
  console.keyMap = "us";
  # Tiling Window Manager
  services.xserver.windowManager.leftwm.enable = true;
  # libs
  #services.picom.enable = true;
  services.udisks2.enable = true;

  # Display Manager
  services.xserver.displayManager.lightdm.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound. with pipewire
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  services.pipewire = {
   enable = true;
   alsa.enable = true;
   alsa.support32Bit = true;
   pulse.enable = true;
   wireplumber.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.krovuxdev = {
     isNormalUser = true;
	 # Enable ‘sudo’ for the user.
     extraGroups = [ "wheel" "networkmanager" "video" "audio" "storage"  ]; 
     packages = with pkgs; [];
   };
#Graphics Amd
  boot.initrd.kernelModules = [ "amdgpu" ];
  services.xserver.videoDrivers = ["amdgpu"];
  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ]; 

  hardware.opengl.extraPackages = with pkgs; [
	  rocmPackages.clr.icd
	  amdvlk
  ];
  hardware.opengl.driSupport = true;
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
	firefox
	brave
	vim 
	#runtime for js
	bun
	nodejs_21
	#git
	#Copy|Paste for text
	xclip

	#extracte for web
	wget
	#TUI for GPG Password is awesome :D -> Do not use GTk or Gnome is bad
	pinentry-curses
	#Control keyboard | volume
	pamixer
	playerctl
	#(import /home/krovuxdev/Documentos/changevolume/changevolume.nix {inherit pkgs;})

  ];
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
	  enable = true;
	  enableSSHSupport = true;
	  pinentryPackage = pkgs.pinentry-curses;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "23.11"; # Did you read the comment?

}

