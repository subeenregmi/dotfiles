{ config, pkgs, ... }:
let 
  nixvim = import (builtins.fetchGit {
    url = "https://github.com/nix-community/nixvim";
  });
in
{
  imports = [
    nixvim.homeModules.nixvim
    ./colorscheme.nix
    ./keymaps.nix
    ./options.nix
    ./plugins/telescope.nix
    ./plugins/icons.nix
    ./plugins/nvim-tree.nix
  ];

  programs.nixvim.enable = true;
}
