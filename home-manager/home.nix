{ config, pkgs, lib, ... }:

{
  imports = lib.filesystem.listFilesRecursive ./modules;
  home.username = "subeen";
  home.homeDirectory = "/home/subeen";

  home.stateVersion = "25.05"; 

  home.packages = [ ];

  home.file = { };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
