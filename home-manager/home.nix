{ config, pkgs, lib, ... }:

{
  imports = lib.filter (n: lib.strings.hasSuffix ".nix" n) (lib.filesystem.listFilesRecursive ./modules);
  home.username = "subeen";
  home.homeDirectory = "/home/subeen";

  home.stateVersion = "25.05"; 

  home.sessionVariables = {
     EDITOR = "nvim";
     VISUAL = "nvim";
     NIXOS_OZONE_WL = "1";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
