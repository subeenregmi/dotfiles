let 
  pkgs = import <nixpkgs> {};
  system = builtins.currentSystem;
  solhintFlake = builtins.getFlake "/home/subeen/subeenfiles/code/dotfiles/custom/solhint";
  solhint = solhintFlake.packages.${system}.default;

  soliditylsFlake = builtins.getFlake "/home/subeen/subeenfiles/code/dotfiles/custom/solidity_nm";
  solidityls = soliditylsFlake.packages.${system}.default;
in
{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      servers = {
        solidity_ls_nomicfoundation = {
          enable = true;
          package = solidityls;
          settings = {
            linter = "solhint";
          };
        };
      };
    }; 

    lint = {
      enable = true;
      lintersByFt = {
        solidity = [ "solhint"];
      };

      linters = {
        solhint = {
          cmd = "${solhint}/bin/solhint";
        };
      };
    };
  };

  home.packages = with pkgs; [
    solc
    solhint
    solidityls
  ];
}
