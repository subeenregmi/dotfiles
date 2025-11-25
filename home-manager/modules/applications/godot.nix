{ config, pkgs, ...}:
{
  home.packages = with pkgs; [
    godotPackages_4_5.godot
  ];
}
