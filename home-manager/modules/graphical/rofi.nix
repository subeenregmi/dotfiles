{ config, pkgs, ... }:
let
    unstable = import <nixpkgs-unstable> {};
in 
{
    programs.rofi = {
        enable = true;
        package = unstable.rofi;
        theme = "catppuccin-default.rasi";
    };
}
