{ config, pkgs, lib, ... }:

{
    
  programs.waybar = {

    enable = true;
    systemd.enable = true;
    style = ''
      ${builtins.readFile /home/subeen/subeenfiles/code/dotfiles/waybar/mocha.css }
        * {
          /* reference the color by using @color-name */
          color: @text;
        }

        window#waybar {
          /* you can also GTK3 CSS functions! */
          background-color: shade(@base, 0.9);
          border: 2px solid alpha(@crust, 0.3);
        }
    '';
  };
}
