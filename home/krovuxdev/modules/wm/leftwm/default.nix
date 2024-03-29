{
  config,
  pkgs,
  lib,
  ...
}:
with lib; {
  home = {
    file.".config/leftwm/config.ron".source = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/krovuxdev/dotfiles/main/.config/leftwm/config.ron";
      sha256 = "0hjr60p26nli3cibwh015yqiciaa2phlm2sflzs1w5r1zhmlfywj";
    };
    file.".config/leftwm/themes/deviuspro_leftwm/up".source = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/krovuxdev/dotfiles/main/.config/leftwm/themes/deviuspro_leftwm/up";
      sha256 = "0s39q0pscw84nr082ngzw32cqjlq84fx2i3gd1y87603zfbn7223";
    };
    file.".config/leftwm/themes/deviuspro_leftwm/down".source = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/krovuxdev/dotfiles/main/.config/leftwm/themes/deviuspro_leftwm/down";
      sha256 = "0l65z8rdb5wklzp93xmjw2cv3r7nm2wxb4f778jy6yfl6z2cbi2p";
    };
    file.".config/leftwm/themes/deviuspro_leftwm/change_to_tag".source = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/krovuxdev/dotfiles/main/.config/leftwm/themes/deviuspro_leftwm/change_to_tag";
      sha256 = "1sy5j562q9lmma8539vzspg3h51hmsacydkparrr1m1hpnmcxjk1";
    };
    file.".config/leftwm/themes/deviuspro_leftwm/compton.conf".source = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/krovuxdev/dotfiles/main/.config/leftwm/themes/deviuspro_leftwm/compton.conf";
      sha256 = "1fx43n7xhrdaiy012q3x4v8pd978j7iinjilw1am57x1k41cn8sq";
    };
    file.".config/leftwm/themes/deviuspro_leftwm/theme.ron".source = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/krovuxdev/dotfiles/main/.config/leftwm/themes/deviuspro_leftwm/theme.ron";
      sha256 = "04h6xznsswminj3jspzlgir42nlgvapwgqpv71mh102lyk0i0rzi";
    };
    file."./config/leftwm/themes/deviuspro_leftwm/Wallpaper".text = ''
      #!/usr/env bash
        #set feh or nitrogen
        if [ -x "$(command -v feh)" ]; then
            feh --bg-scale .config/Wallpaper/exquisito.* &
        elif [ -x "$(command -v nitrogen)" ]; then
            nitrogen --restore &
        fi
    '';
    file."./config/leftwm/themes/deviuspro_leftwm/Wallpaper".executable = true;
    file.".config/leftwm/themes/deviuspro_leftwm/up".executable = true;
    file.".config/leftwm/themes/deviuspro_leftwm/down".executable = true;
    file.".config/leftwm/themes/deviuspro_leftwm/change_to_tag".executable = true;
    activation.writeBoundary = lib.mkForce ''
      ln -sf ~/.config/leftwm/themes/deviuspro_leftwm current

    '';
  };
}
