{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    jetbrains.datagrip
    jetbrains.phpstorm
  ];
}
