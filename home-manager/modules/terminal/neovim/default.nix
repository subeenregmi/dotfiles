{ config, pkgs, ... }:
let 
  nixvim = import (builtins.fetchGit {
    url = "https://github.com/nix-community/nixvim";
    rev = "695b0b80f8452bc584adf23eb58bdc9f599e35eb";
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

  programs.nixvim.enable = true;
}
