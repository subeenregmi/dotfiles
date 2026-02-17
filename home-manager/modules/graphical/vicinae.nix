{ config, pkgs, ...}:
let
    pkgs = import <nixpkgs-unstable> {};
in 
{
  home.packages = with pkgs; [
    vicinae
  ];
}
