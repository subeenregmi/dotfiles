{ pkgs, ... }:
{
  programs.nixvim.plugins = {
    lsp = {
      servers = {
        intelephense = {
          enable = true;
          package = pkgs.intelephense;
        };
      };
    };
  };
}
