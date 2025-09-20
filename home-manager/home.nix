{ config, pkgs, ... }:

{

  imports = [
    ./alacritty.nix
    ./git.nix
    ./nvim.nix
    ./tmux.nix
    ./zsh.nix
  ];
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
