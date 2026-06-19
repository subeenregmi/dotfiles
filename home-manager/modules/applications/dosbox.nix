{ pkgs, ... }:
{
  home.packages = with pkgs; [
    dosbox-x
  ];
}
