{ pkgs, ... }:
{
  programs.nixvim.plugins.treesitter = {
    enable = true;
    grammarPackages = pkgs.vimPlugins.nvim-treesitter.passthru.allGrammars;
    settings = {
      highlight = {
        enable = true;
      };
    };
  };
}
