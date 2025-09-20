{ config, pkgs, lib, ... }:

{
  imports = lib.filesystem.listFilesRecursive ./modules;
  home.username = "subeen";
  home.homeDirectory = "/home/subeen";

  home.stateVersion = "25.05"; 

  home.sessionVariables = {
     EDITOR = "nvim";
     VISUAL = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
