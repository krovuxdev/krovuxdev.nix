{
  config,
  pkgs,
  lib,
  ...
}:
with lib; {
    home.file.".config/leftwm/config.ron".source = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/krovuxdev/dotfiles/main/.config/leftwm/config.ron";
      sha256 = "0hjr60p26nli3cibwh015yqiciaa2phlm2sflzs1w5r1zhmlfywj";
    };
    home.file.".config/leftwm/themes/current/up".source = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/krovuxdev/dotfiles/main/.config/leftwm/themes/deviuspro_leftwm/up";
      sha256 = "0s39q0pscw84nr082ngzw32cqjlq84fx2i3gd1y87603zfbn7223";
    };
    home.file.".config/leftwm/themes/current/up".executable = true;
    home.file.".config/leftwm/themes/current/down".source = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/krovuxdev/dotfiles/main/.config/leftwm/themes/deviuspro_leftwm/down";
      sha256 = "0l65z8rdb5wklzp93xmjw2cv3r7nm2wxb4f778jy6yfl6z2cbi2p";
    };
    home.file.".config/leftwm/themes/current/down".executable = true;
    home.file.".config/leftwm/themes/current/change_to_tag".source = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/krovuxdev/dotfiles/main/.config/leftwm/themes/deviuspro_leftwm/change_to_tag";
      sha256 = "1sy5j562q9lmma8539vzspg3h51hmsacydkparrr1m1hpnmcxjk1";
    };
    home.file.".config/leftwm/themes/current/change_to_tag".executable = true;
    home.file.".config/leftwm/themes/current/compton.conf".source = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/krovuxdev/dotfiles/main/.config/leftwm/themes/deviuspro_leftwm/compton.conf";
      sha256 = "1fx43n7xhrdaiy012q3x4v8pd978j7iinjilw1am57x1k41cn8sq";
    };
    home.file.".config/leftwm/themes/current/theme.ron".source = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/krovuxdev/dotfiles/main/.config/leftwm/themes/deviuspro_leftwm/theme.ron";
      sha256 = "04h6xznsswminj3jspzlgir42nlgvapwgqpv71mh102lyk0i0rzi";
    };
     home.file.".config/leftwm/themes/current/Wallpaper" = {
     text =  ''
      #!/usr/bin/env bash
      echo "hola"
         #set feh or nitrogen
         if [ -x "$(command -v feh)" ]; then
             feh --bg-scale ~/.config/Wallpaper/dom.* &
         elif [ -x "$(command -v nitrogen)" ]; then
             nitrogen --restore &
         fi
     '';
     executable = true;
     };
}
