{ config, pkgs, ... }:
let 
  nixvim = import (builtins.fetchGit {
    url = "https://github.com/nix-community/nixvim/";
  });
in
{
  imports = [
    nixvim.homeModules.nixvim
      ./colorscheme.nix
      ./keymaps.nix
      ./options.nix
      ./diagnostics.nix
      ./autocmds.nix
      ./plugins/telescope.nix
      ./plugins/icons.nix
      ./plugins/nvim-tree.nix
      ./plugins/treesitter.nix
      ./lsp/nix.nix
      ./lsp/go.nix
  ];

  programs.nixvim = {
    enable = true;
  };
}
