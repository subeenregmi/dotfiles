let 
  system = builtins.currentSystem;
  circomLspFlake = builtins.getFlake "/home/subeen/subeenfiles/code/dotfiles/custom/circom-lsp";
  circomLsp = circomLspFlake.packages.${system}.default;
in {
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      servers = {
        circom-lsp = {
          enable = true;
          package = circomLsp;
        };
      };
    };
  };
}
