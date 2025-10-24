{ config, pkgs, ... }:
let
    unstable = import <nixos-unstable> {};
in 
{
    programs.rofi = {
        enable = true;
        package = unstable.rofi;
        theme = "catppuccin-default.rasi";
    };
}
