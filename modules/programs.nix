{pkgs, ...}: {
  #TUI for GPG Password is awesome :D -> Do not use GTk or Gnome is bad
  #environment.systemPackages = with pkgs; [pinentry-curses];
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryPackage = pkgs.pinentry-curses;
  };
  #Explorer
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
    ];
  };
  services.tumbler.enable = true;
  services.gvfs.enable = true;

  #Config checks on gtk
  programs.dconf.enable = true;
}
